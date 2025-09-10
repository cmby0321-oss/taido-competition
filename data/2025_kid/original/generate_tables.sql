create table hokei_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(hokei_man_player_id),
foreign key (right_player_id) references players(hokei_man_player_id),
primary key(id));

create table hokei_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(hokei_woman_player_id),
foreign key (right_player_id) references players(hokei_woman_player_id),
primary key(id));

create table zissen_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(zissen_man_player_id),
foreign key (right_player_id) references players(zissen_man_player_id),
primary key(id));

create table zissen_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(zissen_woman_player_id),
foreign key (right_player_id) references players(zissen_woman_player_id),
primary key(id));

create table hokei_kyuui
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(hokei_kyuui_player_id),
foreign key (right_player_id) references players(hokei_kyuui_player_id),
primary key(id));

create table junior_high_hokei_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(junior_high_hokei_man_player_id),
foreign key (right_player_id) references players(junior_high_hokei_man_player_id),
primary key(id));

create table junior_high_hokei_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(junior_high_hokei_woman_player_id),
foreign key (right_player_id) references players(junior_high_hokei_woman_player_id),
primary key(id));

create table junior_high_zissen_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(junior_high_zissen_man_player_id),
foreign key (right_player_id) references players(junior_high_zissen_man_player_id),
primary key(id));

create table junior_high_zissen_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(junior_high_zissen_woman_player_id),
foreign key (right_player_id) references players(junior_high_zissen_woman_player_id),
primary key(id));

create table higher_grades_hokei_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(higher_grades_hokei_man_player_id),
foreign key (right_player_id) references players(higher_grades_hokei_man_player_id),
primary key(id));

create table higher_grades_hokei_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(higher_grades_hokei_woman_player_id),
foreign key (right_player_id) references players(higher_grades_hokei_woman_player_id),
primary key(id));

create table higher_grades_zissen_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(higher_grades_zissen_man_player_id),
foreign key (right_player_id) references players(higher_grades_zissen_man_player_id),
primary key(id));

create table higher_grades_zissen_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(higher_grades_zissen_woman_player_id),
foreign key (right_player_id) references players(higher_grades_zissen_woman_player_id),
primary key(id));

create table lower_grades_hokei_man
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(lower_grades_hokei_man_player_id),
foreign key (right_player_id) references players(lower_grades_hokei_man_player_id),
primary key(id));

create table lower_grades_hokei_woman
(id integer not null,
left_player_id integer,
right_player_id integer,
next_left_id integer,
next_right_id integer,
left_player_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_player_id) references players(lower_grades_hokei_woman_player_id),
foreign key (right_player_id) references players(lower_grades_hokei_woman_player_id),
primary key(id));

\copy hokei_man from 'hokei_man.csv' csv header;
\copy zissen_man from 'zissen_man.csv' csv header;
\copy hokei_woman from 'hokei_woman.csv' csv header;
\copy zissen_woman from 'zissen_woman.csv' csv header;
\copy hokei_kyuui from 'hokei_kyuui.csv' csv header;
\copy junior_high_hokei_man from 'junior_high_hokei_man.csv' csv header;
\copy junior_high_zissen_man from 'junior_high_zissen_man.csv' csv header;
\copy junior_high_hokei_woman from 'junior_high_hokei_woman.csv' csv header;
\copy junior_high_zissen_woman from 'junior_high_zissen_woman.csv' csv header;
\copy higher_grades_hokei_man from 'higher_grades_hokei_man.csv' csv header;
\copy higher_grades_zissen_man from 'higher_grades_zissen_man.csv' csv header;
\copy higher_grades_hokei_woman from 'higher_grades_hokei_woman.csv' csv header;
\copy higher_grades_zissen_woman from 'higher_grades_zissen_woman.csv' csv header;
\copy lower_grades_hokei_man from 'lower_grades_hokei_man.csv' csv header;
\copy lower_grades_hokei_woman from 'lower_grades_hokei_woman.csv' csv header;

create table dantai_hokei_groups
(id integer not null,
group_id integer not null,
name text not null,
foreign key (group_id) references groups(id),
primary key(id));

create table dantai_hokei
(id integer not null,
group_id integer,
round integer,
main_score real,
sub1_score real,
sub2_score real,
penalty real,
retire integer,
foreign key (group_id) references dantai_hokei_groups(id),
primary key(id));

create table tenkai_groups
(id integer not null,
group_id integer not null,
name text not null,
foreign key (group_id) references groups(id),
primary key(id));

create table tenkai
(id integer not null,
group_id integer,
round integer,
main_score real,
sub1_score real,
sub2_score real,
sub3_score real,
sub4_score real,
sub5_score real,
elapsed_time real,
penalty real,
retire integer,
foreign key (group_id) references tenkai_groups(id),
primary key(id));

\copy dantai_hokei_groups from 'dantai_hokei_groups.csv' csv header;
\copy dantai_hokei from 'dantai_hokei.csv' csv header;
\copy tenkai_groups from 'tenkai_groups.csv' csv header;
\copy tenkai from 'tenkai.csv' csv header;

create table dantai_zissen_man_groups
(id integer not null,
group_id integer not null,
name text not null,
foreign key (group_id) references groups(id),
primary key(id));

create table dantai_zissen_man
(id integer not null,
left_group_id integer,
right_group_id integer,
next_left_id integer,
next_right_id integer,
left_group_flag integer,
left_retire integer,
right_retire integer,
foreign key (left_group_id) references dantai_zissen_man_groups(id),
foreign key (right_group_id) references dantai_zissen_man_groups(id),
primary key(id));

\copy dantai_zissen_man_groups from 'dantai_zissen_man_groups.csv' csv header;
\copy dantai_zissen_man from 'dantai_zissen_man.csv' csv header;

create table block_a
(id integer not null,
 event_id integer not null,
 time_schedule text not null,
 before_final integer not null,
 final integer not null,
 players_checked integer not null,
 next_unused_num integer not null,
 foreign key (event_id) references event_type(id),
primary key(id));

create table block_a_games
(id integer not null,
 schedule_id integer not null,
 order_id integer not null,
 game_id integer not null,
 foreign key (schedule_id) references block_a(id),
primary key(id));

create table current_block_a
(id integer not null,
 game_id integer not null,
 foreign key (id) references block_a(id));

create table block_b
(id integer not null,
 event_id integer not null,
 time_schedule text not null,
 before_final integer not null,
 final integer not null,
 players_checked integer not null,
 next_unused_num integer not null,
 foreign key (event_id) references event_type(id),
primary key(id));

create table block_b_games
(id integer not null,
 schedule_id integer not null,
 order_id integer not null,
 game_id integer not null,
 foreign key (schedule_id) references block_b(id),
primary key(id));

create table current_block_b
(id integer not null,
 game_id integer not null,
 foreign key (id) references block_b(id));

create table block_c
(id integer not null,
 event_id integer not null,
 time_schedule text not null,
 before_final integer not null,
 final integer not null,
 players_checked integer not null,
 next_unused_num integer not null,
 foreign key (event_id) references event_type(id),
primary key(id));

create table block_c_games
(id integer not null,
 schedule_id integer not null,
 order_id integer not null,
 game_id integer not null,
 foreign key (schedule_id) references block_c(id),
primary key(id));

create table current_block_c
(id integer not null,
 game_id integer not null,
 foreign key (id) references block_c(id));

create table block_d
(id integer not null,
 event_id integer not null,
 time_schedule text not null,
 before_final integer not null,
 final integer not null,
 players_checked integer not null,
 next_unused_num integer not null,
 foreign key (event_id) references event_type(id),
primary key(id));

create table block_d_games
(id integer not null,
 schedule_id integer not null,
 order_id integer not null,
 game_id integer not null,
 foreign key (schedule_id) references block_d(id),
primary key(id));

create table current_block_d
(id integer not null,
 game_id integer not null,
 foreign key (id) references block_d(id));

create table block_e
(id integer not null,
 event_id integer not null,
 time_schedule text not null,
 before_final integer not null,
 final integer not null,
 players_checked integer not null,
 next_unused_num integer not null,
 foreign key (event_id) references event_type(id),
primary key(id));

create table block_e_games
(id integer not null,
 schedule_id integer not null,
 order_id integer not null,
 game_id integer not null,
 foreign key (schedule_id) references block_e(id),
primary key(id));

create table current_block_e
(id integer not null,
 game_id integer not null,
 foreign key (id) references block_e(id));

create table block_f
(id integer not null,
 event_id integer not null,
 time_schedule text not null,
 before_final integer not null,
 final integer not null,
 players_checked integer not null,
 next_unused_num integer not null,
 foreign key (event_id) references event_type(id),
primary key(id));

create table block_f_games
(id integer not null,
 schedule_id integer not null,
 order_id integer not null,
 game_id integer not null,
 foreign key (schedule_id) references block_f(id),
primary key(id));

create table current_block_f
(id integer not null,
 game_id integer not null,
 foreign key (id) references block_f(id));

\copy block_a from 'block_a.csv' csv header;
\copy block_a_games from 'block_a_games.csv' csv header;

insert into current_block_a(id, game_id) values (1, 1);

\copy block_b from 'block_b.csv' csv header;
\copy block_b_games from 'block_b_games.csv' csv header;

insert into current_block_b(id, game_id) values (1, 1);

\copy block_c from 'block_c.csv' csv header;
\copy block_c_games from 'block_c_games.csv' csv header;

insert into current_block_c(id, game_id) values (1, 1);

\copy block_d from 'block_d.csv' csv header;
\copy block_d_games from 'block_d_games.csv' csv header;

insert into current_block_d(id, game_id) values (1, 1);

\copy block_e from 'block_e.csv' csv header;
\copy block_e_games from 'block_e_games.csv' csv header;

insert into current_block_e(id, game_id) values (1, 1);

\copy block_f from 'block_f.csv' csv header;
\copy block_f_games from 'block_f_games.csv' csv header;

insert into current_block_f(id, game_id) values (1, 1);

create table awarded_players
(id integer not null,
award_name text not null,
player_id integer,
name text,
foreign key (player_id) references players(id),
primary key (id));

\copy awarded_players from 'awarded_players.csv' csv header;
