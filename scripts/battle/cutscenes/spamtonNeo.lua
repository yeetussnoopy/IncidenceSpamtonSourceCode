return {
    convince = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion

        cutscene:text("(The Green Knight could only shield those he cared about.)")

             cutscene:text("...", "down", "noelle")
            cutscene:text("(You cannot falter.)")

cutscene:wait(1)

            cutscene:text("Why?")
cutscene:battlerText(enemy, "WHAT A [Bonkers]\nQUESTION!!")
cutscene:battlerText(enemy, " I’VE BEEN TRYING TO\n[Telephone] TJIS\nWHOLE TIME!!\nPICK UP A LITTLE\n[[Contextual Clues]]\nKRIS!!!")
cutscene:wait(1)

            enemy:addMercy(2)
            cutscene:text("It’s freedom, isn’t it?")
            cutscene:wait(1)

            enemy:addMercy(1)
            cutscene:text("Not just from the strings. Not just from other people.")
            cutscene:text("But from the world’s ability to tell you what you can and can’t do.")
cutscene:battlerText(enemy, "YOU SAID IT, KID!!\n[The Magic Word]!!!")
cutscene:wait(1)

            enemy:addMercy(2)
cutscene:battlerText(enemy, "I’M [Sick and Tired]\nOF BEING [*$%&]ED\nOVER A [Dishwashing\nUnit] UNTIL I\n[£&^$] [Glitter]\n!!!!")
cutscene:wait(1)

            enemy:addMercy(3)


    end,

        convince2 = function(cutscene, battler, enemy)
            -- Open textbox and wait for completion

            cutscene:text("You gave up so much for that, didn’t you? Your occupation.")
                    enemy:addMercy(2)

                cutscene:text("Your friends. A better probability of saving the world.")
                                enemy:addMercy(1)

                 cutscene:text("(Silence.)")

    cutscene:battlerText(enemy, "WHAT’S YOUR\n[[Jam]] KRIS?")
    cutscene:battlerText(enemy, "WHAT ARE\nYOU TRYING\nTO TELL ME???")
    cutscene:battlerText(enemy, "[Your] JSUT LIKE\nTHAT GODDAMNED\n[hello? are you\nthere?]!!!")
                    enemy:addMercy(3)

    cutscene:text("(He’ll not treat this as effective manipulation.) ")
    cutscene:text("(He believes that he’s cornered you, and left you unable to speak with foreknowledge.)")
    cutscene:text("You were willing to give up living for a chance of that freedom, Spamton.")
    cutscene:text("How far would you go, for that?")
                    enemy:addMercy(4)


cutscene:wait(2)
    cutscene:battlerText(enemy, "ANYTHING GOES\nKID.")


        end,

      convince3 = function(cutscene, battler, enemy)
            -- Open textbox and wait for completion

            cutscene:text("Anything? Could you look in my eyes, and tell me that?")
                    enemy:addMercy(2)

                cutscene:text("Your friends. A better probability of saving the world.")

                 cutscene:text("(Silence.)")

    cutscene:battlerText(enemy, "I’DD BREAK A\n[Deal] FOR\n[Hyperlink Blocked].")

    cutscene:battlerText(enemy, "I’D [$*£$] MYSELF\nWITH A FIR3WORKS\nFOR [Hyperlink Blocked].")

    cutscene:battlerText(enemy, "ID [Going-away\nPermanently Sale]\nFOR [Hyperlink Blocked].")
                                        enemy:addMercy(79)

    cutscene:text("Ah.")
    cutscene:text("Thought as much.")


        end,
}