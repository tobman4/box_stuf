using System;
using System.Drawing;

using tic_tac_toe.AI;
using tic_tac_toe.Game;

namespace tic_tac_toe
{
    class Program
    {
        static void Main(string[] args)
        {
            Board b = new Board();

            b.place(0,2,'O');
            b.place(1,2,'O');
            //b.place(0,2,'O');
            
            b.show();
            
        }
    }
}
