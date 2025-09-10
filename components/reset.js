import axios from "axios";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import Container from "@mui/material/Container";
import React from "react";
import { createRoot } from "react-dom/client";

function onSubmit(database_name, event_names, block_names) {
  let post = {
    database_name: database_name,
    event_names: event_names,
    block_names: block_names,
  };
  axios
    .post("/api/reset_db", post)
    .then((response) => {})
    .catch((e) => {
      console.log(e);
    });
}

const PopupComponent = ({
  onClose,
  database_name,
  event_names,
  block_names,
}) => {
  const handleDecision = () => {
    onSubmit(database_name, event_names, block_names);
    onClose();
  };

  return (
    <div className="popup">
      <p>
        <b>
          本当に初期化しますか？
          <br />
          辞める場合はwindowを閉じて下さい
        </b>
      </p>
      <button onClick={handleDecision}>本当に初期化する</button>
    </div>
  );
};

function ResetButton({
  database_name,
  event_names,
  block_names,
  text,
  is_mobile,
}) {
  const handlePopup = () => {
    const popupWindow = window.open("", "_blank", "width=350,height=50");

    popupWindow.document.body.innerHTML = `
      <div id="popup-container"></div>
    `;
    const popupContainer =
      popupWindow.document.getElementById("popup-container");

    const handleClose = () => {
      popupWindow.close();
    };

    const root = createRoot(popupContainer);
    root.render(
      <PopupComponent
        onClose={handleClose}
        database_name={database_name}
        event_names={event_names}
        block_names={block_names}
      />,
    );
  };
  const minWidth = is_mobile ? "200px" : "840px";
  return (
    <div>
      <Container maxWidth="md">
        <Box style={{ minWidth: minWidth }}>
          <Grid
            container
            justifyContent="center"
            alignItems="center"
            style={{ height: "80px" }}
          >
            <Button
              variant="contained"
              type="submit"
              style={{ backgroundColor: "gray" }}
              onClick={handlePopup}
            >
              {text}
            </Button>
          </Grid>
        </Box>
      </Container>
    </div>
  );
}

export default ResetButton;
