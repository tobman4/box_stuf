using System;
using System.Drawing;

using tic_tac_toe;
using tic_tac_toe.Game;

namespace tic_tac_toe.AI {
    public class tmp_board : Board {
        
        public tmp_board[] moves;
        private sbyte score = -99;

        public Point move_made {
            get;
            private set;
        }

        public tmp_board(Board b) : base(b) {
        }

        public sbyte make_path() {
            
            
            char p = Brain.player;
            bool maxing = p == (turn ? 'X' : 'O');

            if(Brain.is_game_done(this)) {
                
                char w = this.is_game_over();

                if(w == p) {
                    score = 1;
                } else if(w == 'N') { 
                    score = 0;
                } else {
                    score = -1;
                }
                return score;
            }

            moves = Brain.get_all(this);

            sbyte best = 0;

            foreach(tmp_board b in moves) {
                sbyte res = b.make_path();
                if(res == best) {
                    score = best;
                } else if(maxing && res > best) {
                    best = res;
                } else if(!maxing && res < best) {
                    best = res;
                }
            }
            score = best;
            return score;
        }

        public Point get_move() {
            tmp_board o = moves[0];
            foreach(tmp_board b in moves) {
                if(o.score < b.score) {
                    o = b;
                }
            }
            return o.move_made;
        }

        override public bool point_plcae(Point p, char F = 'N') {
            /*if(move_made != null) {
                throw new Exception("tmb board can only make one move");
            } else {
                move_made = p;
                return base.point_plcae(p);
            }*/
                if(F != 'N') {
                    throw new NotImplementedException();
                }
                move_made = p;
                return base.point_plcae(p,F);
        }

    }
}
