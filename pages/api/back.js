import GetClient from "../../lib/db_client";
import { Set } from "../../lib/redis_client";

const Back = async (req, res) => {
  try {
    const client = await GetClient();
    const current_block_name = "current_block_" + req.body.update_block;
    let query = "select game_id from " + current_block_name;
    let result = await client.query(query);
    if (result.rows[0].game_id > 1) {
      query = "update " + current_block_name + " set game_id = game_id - 1";
      result = await client.query(query);
      const key = "update_game_id_for_" + current_block_name;
      const timestamp = Date.now();
      await Set(key, timestamp);
    }
    res.json({});
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error fetching data" });
  }
};

export default Back;
