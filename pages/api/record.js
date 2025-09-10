import GetClient from "../../lib/db_client";
import { Set } from "../../lib/redis_client";

const Record = async (req, res) => {
  try {
    const client = await GetClient();
    const event_name = req.body.event_name;
    const type = event_name.includes("dantai") ? "group" : "player";
    let query =
      "update " + event_name + " set left_" + type + "_flag = $2 where id = $1";
    let values = [
      req.body.id,
      type === "group" ? req.body.left_group_flag : req.body.left_player_flag,
    ];
    let result = await client.query(query, values);
    let count_query = "select count(*) from " + event_name;
    let count_result = await client.query(count_query);
    const count = count_result.rows[0]["count"];
    if (req.body.next_type === "left") {
      query =
        "update " + event_name + " set left_" + type + "_id = $1 where id = $2";
      values = [
        type === "group" ? req.body.next_group_id : req.body.next_player_id,
        req.body.next_id,
      ];
      result = await client.query(query, values);
      if (parseInt(req.body.next_id) === parseInt(count)) {
        values = [req.body.loser_id, req.body.next_id - 1];
        result = await client.query(query, values);
      }
    } else {
      query =
        "update " +
        event_name +
        " set right_" +
        type +
        "_id = $1 where id = $2";
      values = [
        type === "group" ? req.body.next_group_id : req.body.next_player_id,
        req.body.next_id,
      ];
      result = await client.query(query, values);
      if (parseInt(req.body.next_id) === parseInt(count)) {
        values = [req.body.loser_id, req.body.next_id - 1];
        result = await client.query(query, values);
      }
    }
    const key = "latest_update_result_for_" + event_name + "_timestamp";
    const timestamp = Date.now();
    await Set(key, timestamp);
    if (req.body.update_block === undefined || req.body.update_block === null) {
      res.json({});
      return;
    }
    const current_block_name = "current_block_" + req.body.update_block;
    query = "select id, game_id from " + current_block_name;
    result = await client.query(query);
    const next_game_id = result.rows[0].game_id + 1;
    const schedule_id = result.rows[0].id;
    query =
      "select id from block_" +
      req.body.update_block +
      "_games where order_id = " +
      next_game_id +
      " and schedule_id = " +
      schedule_id;
    result = await client.query(query);
    console.log(result.rows);
    const update_game_id_key = "update_game_id_for_" + current_block_name;
    await Set(update_game_id_key, timestamp);
    if (result.rows.length === 0) {
      query = "update " + current_block_name + " set id = id + 1, game_id = 1";
      result = await client.query(query);
      const update_id_key = "update_id_for_" + current_block_name;
      await Set(update_id_key, timestamp);
    } else {
      query = "update " + current_block_name + " set game_id = " + next_game_id;
      result = await client.query(query);
    }
    res.json({});
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error fetching data" });
  }
};

export default Record;
