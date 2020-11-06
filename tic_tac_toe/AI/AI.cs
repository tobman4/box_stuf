using System;
using System.Drawing;

using tic_tac_toe;
using tic_tac_toe.Game;

namespace tic_tac_toe.AI {
    public static class Brain {

        public static char player = 'O';

        public static tmp_board[] get_all(Board b) {
            Point[] points = b.get_free_space();
            tmp_board[] o = new tmp_board[points.Length];

            for(int i = 0; i < points.Length; i++) {
                o[i] = new tmp_board(b);
                o[i].point_plcae(points[i]);
            }

            return o;
        }

        public static bool is_game_done(Board b) {
            return b.is_game_over() != 'N' || b.get_free_space().Length == 0;
        }

        public static Point get_move(Board b) {
            tmp_board curr = new tmp_board(b);
            curr.make_path();
            Point p = curr.get_move();
            return p;
        }

    }
}