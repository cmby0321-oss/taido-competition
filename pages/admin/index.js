import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import React from "react";
import Container from "@mui/material/Container";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import checkStyles from "../../styles/checks.module.css";
import SyncDisabledIcon from "@mui/icons-material/SyncDisabled";
import SyncIcon from "@mui/icons-material/Sync";

export const getServerSideProps = async (context) => {
  const params = {
    competition_title: process.env.COMPETITION_TITLE,
    production_test: process.env.PRODUCTION_TEST,
    show_total: process.env.SHOW_TOTAL_IN_ADMIN === "1",
  };
  return {
    props: { params },
  };
};

export default function Home({ params }) {
  const router = useRouter();
  const ToBlock = (block_number) => {
    router.push("/admin/block?block_number=" + block_number);
  };
  const ToNotificationRequest = () => {
    router.push("/admin/notification_request");
  };
  const ToSummary = () => {
    router.push("/summary?from_admin=true");
  };
  const ToHighSchoolSummary = () => {
    router.push("/high_school_summary?from_admin=true");
  };
  const ToTotal = () => {
    router.push("/total");
  };
  const hide = params.production_test === "1";
  const [courts, setCourts] = useState([]);

  const fetchCourts = async () => {
    const response = await fetch("/api/get_courts");
    const result = await response.json();
    setCourts(result);
  };
  useEffect(() => {
    fetchCourts();
  }, []);
  return (
    <div>
      <br />
      <Container maxWidth="md">
        <Grid
          container
          justifyContent="center"
          alignItems="center"
          style={{ height: "1vh" }}
        >
          <h1>
            <u>躰道 大会管理システム</u>
          </h1>
        </Grid>
        <br />
        <br />
        <br />
        <br />
        {courts.map((item, index) => {
          return (
            <>
              <Grid
                container
                justifyContent="center"
                alignItems="center"
                style={{ height: "1vh" }}
              >
                <Button
                  variant="contained"
                  type="submit"
                  onClick={(e) => ToBlock(item.name[1].toLowerCase())}
                >
                  {item.name.replace(/['"]+/g, "")}
                </Button>
              </Grid>
              <br />
              <br />
            </>
          );
        })}
        <Grid
          container
          justifyContent="center"
          alignItems="center"
          style={{ height: "1vh" }}
        >
          <Button
            variant="contained"
            type="submit"
            onClick={(e) => ToNotificationRequest()}
          >
            司会用
          </Button>
        </Grid>
        <br />
        <br />
        <br />
        <Grid
          container
          justifyContent="center"
          alignItems="center"
          style={{ height: "80px" }}
        >
          <Button
            variant="contained"
            type="submit"
            onClick={(e) => ToSummary()}
          >
            サマリー
          </Button>
        </Grid>
        {params.competition_title.includes("高校") ? (
          <Grid
            container
            justifyContent="center"
            alignItems="center"
            style={{ height: "80px" }}
          >
            <Button
              variant="contained"
              type="submit"
              onClick={(e) => ToHighSchoolSummary()}
            >
              高校生サマリー
            </Button>
          </Grid>
        ) : (
          <></>
        )}
        {params.show_total ? (
          <Grid
            container
            justifyContent="center"
            alignItems="center"
            style={{ height: "40px" }}
          >
            <Button
              variant="contained"
              type="submit"
              onClick={(e) => ToTotal()}
            >
              総合得点表
            </Button>
          </Grid>
        ) : (
          <></>
        )}
        <br />
        <br />
        <br />
        <br />
        <Grid container justifyContent="center">
          {hide ? (
            <>
              一般公開用ページへの結果反映：<b>OFF</b>
              <SyncDisabledIcon color="disabled" />
            </>
          ) : (
            <>
              一般公開用ページへの結果反映：<b>ON</b>
              <SyncIcon color="primary" />
            </>
          )}
        </Grid>
      </Container>
    </div>
  );
}
