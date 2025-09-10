import GetClient from "../../lib/db_client";
import { Get, Set } from "../../lib/redis_client";

async function GetFromDB(req, res) {
  const client = await GetClient();
  const block_number = req.query.block_number;
  let query = "select id, game_id from current_block_" + block_number;
  let result = await client.query(query);
  return result.rows[0];
}

const CurrentSchedule = async (req, res) => {
  try {
    const block_name = "block_" + req.query.block_number;
    const current_block_name = "current_" + block_name;
    const latest_update_id_key = "update_id_for_" + current_block_name;
    const latest_game_id_update_key =
      "update_game_id_for_" + current_block_name;
    const cache_key = "current_schedule_for_" + block_name;
    const latest_update_timestamp = (await Get(latest_update_id_key)) || 0;
    const latest_game_id_update_timestamp =
      (await Get(latest_game_id_update_key)) || 0;
    const cached_data = await Get(cache_key);
    if (
      cached_data &&
      latest_update_timestamp < cached_data.timestamp &&
      latest_game_id_update_timestamp < cached_data.timestamp
    ) {
      console.log(`using cache for ${cache_key}`);
      return res.json(cached_data.data);
    }
    console.log(`get new data for ${cache_key}`);
    const data = await GetFromDB(req, res);
    console.log(data);
    await Set(cache_key, { data: data, timestamp: Date.now() });
    res.json(data);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error fetching data" });
  }
};

export default CurrentSchedule;
