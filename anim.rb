def clear
print "\e[2J\e[H"  # ANSI escape code to clear terminal
end
# Animate
def animate(score = 0)
  frames = [
<<~FRAME1,
                                    
                            
                        
                    
        
                           *
.                         ***
                           *
                            
                           
                         
            
Game Over! Your score: #{score}
FRAME1

<<~FRAME2,
                                    
                            
                        
                    
                            *
                          *   *
.                        *  *  *
                          *   *
                            *   
                            


Game Over! Your score: #{score}
FRAME2

<<~FRAME3,
                                    
                            
                        
                    
                          *   *   *
                        *          *
.                     *    * * *     *
                        *    *     *
                          *     *
                          *  *  *
                        
                        
Game Over! Your score: #{score}
FRAME3

<<~FRAME4,
                              ____
                      __,-~~/~    `---.
                    _/_,---(        ,    )
                __ /        <      /   )  \\___
  - ------===;;;'====------------------===;;;===----- -  -
                    \\/ ~"~"~"~"~"~\\~"~)~"/
                    (_ (   \\  (     >    \\)
                     \\_( _ <         >_>'
                        ~ `-i' ::>|--"
                            I;|.|.|
                           <|i::|i|`.
                          (` ^'"`-' ")
Game Over! Your score: #{score}
FRAME4
  ]
loop do
  frames.each do |frame|
    clear
    puts frame
    sleep 0.5
  end
end
end
# animate