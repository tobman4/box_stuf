using System;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;

namespace tic_tac_toe.Game {
    public class Board {

        public char[,] board;

        private const char empty_char = '0';

        public bool turn {
            get;
            private set;
        }

        public Board() {

            turn = true;

            board = new char[3,3];
            for(int i = 0; i < 3; i++) {
                for(int j = 0; j < 3; j++) {
                    board[i,j] = empty_char;
                }
            }
        }

        public Board(Board b) {
            board = (char[,])b.board.Clone();
            turn = b.turn;
        }


        public virtual bool point_plcae(Point p, char F = 'N') {
            return this.place(p.X,p.Y,F);
        }

        public bool place(int x, int y, char F = 'N') {
            
            if(F != 'N') {
                board[x,y] = F;
            }
            
            if(board[x,y] != empty_char) {
                return false;
            }

            board[x,y] = turn ? 'X' : 'O';
            turn = !turn;

            return true;
        }

        public Point[] get_free_space() {
            List<Point> o = new List<Point>();

            for(int i = 0; i < 3; i++) {
                for(int j = 0; j < 3; j++) {
                    if(board[i,j] == empty_char) {
                        o.Add(new Point(i,j));
                    }
                }
            }

            return o.ToArray();
        }

        public char is_game_over() {
            if(board[0,0] == board[1,1] && board[1,1] == board[2,2] && board[0,0] != empty_char) {
                return board[0,0];
            }

            for(int i = 0; i < 3; i++) {
                if(board[i,0] == board[i,1] && board[i,1] == board[i,2] && board[i,0] != empty_char) {
                    return board[i,0];
                }
            }

            for(int i = 0; i < 3; i++) {
                if(board[0,i] == board[1,i] && board[1,i] == board[2,i] && board[0,i] != empty_char) {
                    return board[0,i];
                }
            }
            
            return 'N';
        }

        public void show() {
            Console.WriteLine("###############################");
            Console.WriteLine($"{board[0,0]}|{board[1,0]}|{board[2,0]}");
            Console.WriteLine($"-----");
            Console.WriteLine($"{board[0,1]}|{board[1,1]}|{board[2,1]}");
            Console.WriteLine($"-----");
            Console.WriteLine($"{board[0,2]}|{board[1,2]}|{board[2,2]}");
            Console.WriteLine("###############################");
        }


    }    
}