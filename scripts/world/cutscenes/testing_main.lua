return {

 spamton = function(cutscene, event)

   local sNeo = cutscene:getCharacter("spamtonneo")
      local kris = cutscene:getCharacter("kris")
      local ralsei = cutscene:getCharacter("ralsei")
     local noelle = cutscene:getCharacter("noelle")
     local susie = cutscene:getCharacter("susie")
          local berdly = cutscene:getCharacter("berdly")
   local spamton = cutscene:getCharacter("spamton")


  Assets.playSound("won")
  Game:setFlag("bulletToggleCustom", false)

  cutscene:text("[shake:2]Welcome to the Incidence Spamton + MariNeo TakeoverFangame.")
 cutscene:text("This is inspired by Chapter 27 of the Incidence fanfic")
 cutscene:text("And also by omori the video game (real)")
   cutscene:text("All credit goes to JungleDragon (the author of Incidence). Check out the fic urself")
      cutscene:text("the link is uh:")
        Assets.playSound("vineboom")
      cutscene:text("https://archiveofourown.org/works/36150103")
         cutscene:text("oh wait this is deltarune you cant click it lol")
           cutscene:text("Anyway. You ready?")

           cutscene:text("There is also now the choice to turn on no hit modes!")
           cutscene:text("These no hits modes will set the fights to 1 HP!")
        
           local choiceNoHit = cutscene:choicer({"Disable No Hit Modes", "Turn Them On"})

           if choiceNoHit == 1 then
               Game:setFlag("noHit", false)
               cutscene:text("No hit modes are turned off")

           else
               cutscene:text("No hit modes are turned on")

           end

           cutscene:text("Nice.")
           cutscene:text("There also 3 choices you can make.")
           cutscene:text("Watching the intro will play out the incidence spamton cutscene.")
           cutscene:text("Skipping the intro will drop you right into the incidence spamton fight.")
           cutscene:text("There's also now an omori themed hard mode you can play.")
           cutscene:text("While generally being more difficult then the incidence spamton fight")
          cutscene:text("there's a custom storyline its pretty sick i imported the omori font over")
          cutscene:text("There are also custom mechanics too!")
           cutscene:text("Of course Like the main spamton fight, the omori fight will have a no hit mode too.")
           cutscene:text("So toggling the no hit mode from earlier it also applies to that")
           cutscene:text("Of course the omori mode contains spoilers for the game duh")
           cutscene:text("You can return to the main game menu at anytime by holding down escape")
           cutscene:text("You can also like speed through text by holding C")
           cutscene:text("So dont cry about not being able to skip the omori cutscene")
           cutscene:text("You can literally speedrun through it by holding C")


           cutscene:text("So, are you ready?")


    local choice = cutscene:choicer({"Watch\nIntro\n(Spamton)", "Skip\nIntro\n(Spamton)", "Play Mari\n(Omori) Mode"})

if choice == 3 then
     Game:setFlag("bulletToggleCustom", true)

     
     cutscene:fadeOut(2)

     local kris = cutscene:getCharacter("kris")
  local mari = cutscene:getCharacter("mariNeo")
     local spamton = cutscene:getCharacter("spamton")

     kris:remove()
     Game:removePartyMember("kris")

     Game:addPartyMember("spamton")

     spamton = spamton:convertToPlayer()


     cutscene:slideTo(spamton, "omori", 0.01)


     spamton:setSprite("idle/up")

     love.window.setTitle("Cliff-faced as usual! You should [S M I L E] more!")




     cutscene:text("[voice:sneo]* ITS [SOS] DARK IN HERE!")
     cutscene:text("[voice:sneo]* DID I DO IT? DID I GO TO [[H e a v e n]]!")



     mari:setAnimation("shaking")

     cutscene:fadeIn(1)

     Game.world.music:play("fear", 17, 4)

     cutscene:text("[voice:mari][shake:2][font:omori]* NOPE! LET ME FILL YOU IN!!!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* WELCOME TO MY FAVORITE PLACE!", "default", mari)
     cutscene:text("[voice:mari][shake:1][font:omori]* IT'S NOT EXACTLY [WaitingForSomethingToHappen]!", "default", mari)

    --cutscene:text("[voice:mari][shake:1][font:omori]* YOU KIN ME? YOUR JUST LIKE ME? THEN HOW COME YOU GOT NO BITCHES-", "default", mari)

     mari:setAnimation("death")
     cutscene:text("[voice:mari][speed:0.5][font:omori][shake:2.5]* I T ' S  M Y  O W N  P E R F E C T  H E L L")


     cutscene:text("[voice:sneo]* WHAT ARE YOU TALKING ABOUT YOU [[You Poser!!!!]]")
     cutscene:text("[voice:sneo]* ARE YOU TRYING TO STEAL MY [2 For 1 Sale] ON MY [Gimmick]?")
     Assets.playSound("damage")

     cutscene:shakeCamera(10)
     mari:setAnimation("shaking")

     cutscene:text("[voice:mari][font:omori]* WELL YOU SEE YOUR STRUGGLE THROUGH [[BlackSpace Blocked]]", "default", mari)
     cutscene:text("[font:omori][voice:mari][shake:2]* FINALLY ALLOWED ME TO BECOME RELEVANT TO THE DELTARUNE PLOT!", "default", mari)

     cutscene:text("[voice:mari][font:omori]* YOU'VE FINALLY UNDERSTAND!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* AND NOW ITS ALL MINE!", "default", mari)
     cutscene:text("[voice:mari][shake:2][font:omori]* IT'S MY [[Castle]]!! My [[HeadSpace]] My [[World]]!!", "default", mari)
     cutscene:text("[voice:sneo]* HEY THAT'S MY [Special Line]! WHO DO YOU THINK YOU ARE YOU [[Faker!]]")
     Assets.playSound("damage")
     cutscene:shakeCamera(10)
     mari:setAnimation("down")
     cutscene:text("[voice:mari][shake:1][font:omori]* YOU REMOVE THE [0's] AND ADD AN [A] AND THERE ITS ME MARI!!!", "default", mari)
     cutscene:text("[voice:mari][shake:1][font:omori]* EVERYONE'S FAVORITE [Picnic Gal] 1997!", "default", mari)

     cutscene:text("[voice:sneo]* YOUR JUST AN [RipOff] OF THE [Real Deal!]")
     cutscene:text("[voice:sneo]* A [Fake] [Fraud] [Poser]!")

     cutscene:text("[voice:mari][font:omori]* DOESNT [[BlackSpace Blocked]] AT ALL TO ME WHAT YOU THINK!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* WHEN I'M THE ONE [StandingHere] WITH ALL THE POWER!", "default", mari)
     cutscene:text("[voice:mari][font:omori][shake:2]* I USED TO BE JUST THE [Stairs] 4 [Stairs] JOKE BEFORE!!!", "default", mari)

     cutscene:text("[voice:mari][font:omori]* BUT NOW THAT'VE OBTAINED NEO...", "troll", mari)
     Assets.playSound("damage")

     cutscene:shakeCamera(10)

     mari:setAnimation("aim")
     cutscene:text("[voice:mari][font:omori][shake:2]* I WONT HAVE TO [[Ayo The Pizza Here]] ANYMORE!!!", "default", mari)
     cutscene:text("[voice:sneo]* YOU STOLE MY [HeavenReady] BODY! DIDN'T YOU!")
     cutscene:text("[voice:sneo]* YOU THINK YOUR BIG BUT I CAN SEE THAT STRING!")
     cutscene:text("[voice:sneo]* YOUR STILL SO SMALL, JUST ANOTHER [Puppet]!!!")
     cutscene:text("[voice:sneo]* LOOKS LIKE YOUR JUST STILL...")

     cutscene:text("[voice:mari][font:omori]* YOU WOULDNT DARE SAY IT!", "default", mari)
     Assets.playSound("vineboom")
     cutscene:shakeCamera(10)


     cutscene:text("[voice:sneo]* ...HANGING AROUND ON A SILLY STRING!!!!!!!!!!")


     mari:setAnimation("death")
     Assets.playSound("damage")
     cutscene:shakeCamera(10)


     cutscene:text("[voice:mari][shake:0.5][font:omori]* AFTER ALL THE [Flower Crowns] I MADE!", "default", mari)
     Assets.playSound("damage")
     cutscene:shakeCamera(10)
     cutscene:text("[voice:mari][shake:1][font:omori]* ALL THE MEMORIES WE CAPTURED!", "default", mari)

     cutscene:text("[voice:mari][shake:2][font:omori]* AND THIS IS THE [Fate] IM DEALT???", "default", mari)

     cutscene:text("[voice:mari][shake:0.5][font:omori]* I STILL DONT GET THE POINT.......", "default", mari)
     Assets.playSound("damage")
     cutscene:shakeCamera(10)
     cutscene:text("[voice:mari][shake:0.5][font:omori]* YOU TRY TO BE HELPFUL TO EVERYONE!", "default", mari)
     Assets.playSound("damage")
     cutscene:shakeCamera(10)
     cutscene:text("[voice:mari][shake:0.5][font:omori]* YOU PLAY A SONG EXPECTING TO IMPRESS!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* BUT YET!", "default", mari)

     Assets.playSound("vineboom")
     cutscene:shakeCamera(10)


     mari:setAnimation("death")

     cutscene:text("[voice:mari][font:omori][speed:0.5][shake:3]* I'M  S T I L L  N O T  P E R F E C T!")

     cutscene:wait(2)

     cutscene:text("[voice:sneo]* OK SO IT SEEMS YOUR HAVING A LITTLE PROBLEM WITH SOMETHING...")
     cutscene:text("[voice:sneo]* BUT COULD YOU SPARE A [Poor Man] SOME TASTE OF [Freedom]?")
     cutscene:text("[voice:sneo]* :PLEADING:")

     cutscene:wait(2)


     mari:setAnimation("idle")

     cutscene:text("[voice:mari][font:omori]* A problem with...", "default", mari)
     cutscene:text("[voice:mari][font:omori]* S O M E T H I N G?")



     cutscene:text("[voice:mari][font:omori]* I GET IT KNOW! IT'S LIKE I'VE SAID!", "default", mari)

     cutscene:text("[voice:mari][font:omori][shake:2]* [[Picnic]]s are POSSIBLE TO BE MADE ANYWHERE!", "default", mari)
     cutscene:text("[voice:mari][font:omori][shake:1]* WE CAN BE MORE THAN PERFECT TOGETHER!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* SPAMTON!", "troll", mari)
     cutscene:text("[voice:mari][font:omori]* ALL I NEED IS THAT [HeartShapedObject]!", "default", mari)

     cutscene:text("[voice:sneo]* WAIT I HAVE A [Cardiac Organ] IN ME NOW?")
     cutscene:text("[voice:sneo]* IF I GIVE IT TO YOU DO I GET TO BECOME SPAMTON NEO?")

     Assets.playSound("vineboom")
     cutscene:shakeCamera(10)

     cutscene:text("[voice:mari][font:omori]* No", "troll", mari)
     cutscene:wait(2)


     cutscene:text("[voice:sneo]* THEN THE [Deal]'s OFF! BUT I'VE GOT A DIFFERENT IDEA...")

     cutscene:text("[voice:sneo]* IVE LEARNED FROM MY [Fatal Errors] FALLING SHORT TO [Hochi Mamas]!")
     cutscene:text("[voice:sneo]* CLEARLY THE ONLY ANSWER IS [Committing Crimes]!")
     cutscene:text("[voice:sneo]* MY [Specil] CHARITY RUNS OUT HERE!")
     Assets.playSound("vineboom")
     cutscene:text("[voice:sneo]* I'LL BITE THE STRINGS RIGHT OFF YOU AND MAKE YOU GO BYE-BYE!")

     cutscene:shakeCamera(10)
     Assets.playSound("damage")

     mari:setAnimation("shaking")

     cutscene:text("[voice:mari][shake:2][font:omori]* CUTTING ME OFF AT THE GOOD PART YOU LITTLE [[hikikomori]]?", "default", mari)
     cutscene:text("[voice:sneo]* ok that line is literally ripped from the snowgrave ro-")
     cutscene:shakeCamera(10)

     Assets.playSound("vineboom")
     cutscene:text("[voice:mari][font:omori]* SHUT!", "troll", mari)


     cutscene:text("[voice:mari][font:omori]* THAT'S AN ORIGINAL [Patent Pending] LINE I CAME UP WITH!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* Don't make me raise my voice now. SPAMTON!", "troll", mari)
     cutscene:text("[voice:mari][font:omori][shake:2]* YOU COULDN'T BE [P E R F E C T] EVEN IF YOU WANTED TO!", "default", mari)
     cutscene:text("[voice:mari][font:omori][shake:2]* YOU WOULD HAVE TO PRY THE [O m e g a Power] FROM MY DEAD BODY!!!", "default", mari)

     cutscene:text("[voice:sneo]* DON'T DOUBT THE [OG] BIG SHOT KID!")
     cutscene:text("[voice:sneo]* I CAN TAKE YOU DOWN EASILY!")

     cutscene:text("[voice:mari][font:omori]* FAT CHANCE! YOU [[Toll Gator]]", "default", mari)
     cutscene:text("[voice:mari][shake:2][font:omori]* MY DEFENSE IS [Otherworld]LY!!!!!!!!!!!!!!!", "default", mari)
     cutscene:text("[voice:mari][font:omori]* YOU DONT DESERVE MY [Neo!]", "default", mari)
     cutscene:text("[voice:mari][font:omori][shake:2]* I'LL TURN YOU TO [Toast]!!!!!!!!!", "default", mari)

     mari:setAnimation("death")
     cutscene:text("[voice:mari][font:omori]* AND ALL IT COSTS IS YOUR...", "default", mari)
     cutscene:shakeCamera(10)

     Assets.playSound("vineboom")
     cutscene:text("[voice:mari][speed:0.5][font:omori][shake:3]* [h e a r t  s h a p e d  o b j e c t]")
     mari:setAnimation("idle")

     cutscene:text("[voice:mari][shake:2][font:omori]* IT'S TIME FOR THIS BIG SISTER'S COMEBACK PERFORMANCE!", "default", mari)


     cutscene:text("[voice:mari][font:omori]* [Just For You!] T'M HOSTING A VERY [Specil] RECITAL...", "default", mari)

          mari:setAnimation("aim")

     cutscene:text("[voice:mari][font:omori]* THE LAST RECITAL OF YOUR [DeeplyUnclean] LIFE!", "default", mari)



     Assets.playSound("smile_heaven")

     cutscene:wait(3)



    --cutscene:text("[voice:mari]* No pink ribbon either btw hehehaw cope", "default", mari)


    cutscene:slideTo(mari, "omoriAway", 0.01)

      cutscene:startEncounter("mariNeo", true)




          elseif choice == 1 then



        cutscene:fadeOut(3)
            cutscene:slideToSpeed(kris, "kris_start", 20)

     kris:setSprite("battle/victory_6")


          Game.world.music:stop()


        cutscene:look(sNeo, "right")
        cutscene:text("(At the top floor of Queen's mansion...)")

cutscene:text("No. We will win. Whether you recognise the possibility or not doesn’t affect that.")
cutscene:text("If you want to negotiate, you need to offer something worth accepting.")
cutscene:text("Genocide in a week is not that something.")

cutscene:text("* YOU DON’T MAKE DEALS WITH [Low-Quality Steel] LIKE THAT!!", "", sNeo)
Assets.playSound("laugh")
cutscene:wait(3)

cutscene:text("* So long as you need Kris to cause the Roaring in the way you wish...", "roaring", "ralsei")
cutscene:text("* ...then I don’t think you could ever win.", "small_smile", "ralsei")

cutscene:text("* The best you could manage is losing alongside everyone else.", "smile", "ralsei")

cutscene:text("* I… I understand. Empathise, I think.")
cutscene:text("* I’m sorry, for all that it’s worth.")
cutscene:text("* For not being able to convince you all to rest here.")
cutscene:text("* For giving you the hope to fight.")
cutscene:text("*  If… if you want to ask anything-")

Assets.playSound("laugh")
cutscene:wait(3)

Assets.playSound("bomb")
cutscene:wait(2)
Assets.playSound("bigcut")
cutscene:wait(1)

Assets.playSound("paper_surf")
cutscene:fadeIn(1)

cutscene:wait(3)
Assets.playSound("impact")
cutscene:shakeCamera(3)


cutscene:wait(2)

cutscene:text("* WHAT A [Chicanery]!!!", "", sNeo)

Game:setFlag("bulletToggleCustom", false)

Assets.playSound("laugh")
cutscene:wait(3)

kris:shake(3)
cutscene:wait(1)

cutscene:text("* Kris...You're shaking.", "concern_smile", "ralsei")
cutscene:text("Yeah. Don’t worry about it. Just… yeah.")
cutscene:text("(A few words can have a big impact, is all. So long as they’re said just right.)")

cutscene:text("...", "concern", "ralsei")

cutscene:text("(Sometimes these things must be, in order to provoke the right response in future.)")

cutscene:text("* I, um… I guess you need to seal the fountain now, Kris.", "pleased", "ralsei")
cutscene:text("* I’ll go and shout to the others that we’re about to leave.", "pleased", "ralsei")
cutscene:text("* Hopefully they’ll hear me from… well…", "pleased", "ralsei")

cutscene:text("I’ll see you in Castle Town.")

            cutscene:slideToSpeed(ralsei, "offScreen", 3)
            cutscene:wait(4)

cutscene:text("(I guess this is how Ralsei leaves now.)")
ralsei.flip_x = true

cutscene:text("* [Best Deal!] NOT TO LOSE AT THE [Last Chance]!!", "", sNeo)

cutscene:text("(He wants you to use the point. It would be best not to.)")

cutscene:text("I’ll meet you in Castle Town, Spamton. I think I can make this gap.")

cutscene:text("* NO NEED!!! JUST STICK OUT YOUR [Small Arms]!!", "", sNeo)

            cutscene:slideToSpeed(sNeo, kris.x - 60 , kris.y, 3)

            cutscene:wait(3)

            sNeo:setAnimation("aim")
            Assets.playSound("impact")
kris:setSprite("landed_1")

            cutscene:slideToSpeed(kris, "krisLand", 20)

            cutscene:wait(1)


cutscene:text("(You passed through the save point. You're fully healed.)")
cutscene:text("Spamton. Spamton! This wasn't-!")

     Game.world.music:play("meeting")

     


cutscene:text("* IM NOT GONNA [Homicide] YOU KRIS!!", "", sNeo)
Assets.playSound("laugh")
cutscene:wait(3)
cutscene:text("* I JUST WANT TO HAVE A [Phone Call]!!!", "", sNeo)

sNeo:setAnimation("shaking")
cutscene:text("* [Thank you very much!] FOR THE [Sweet Deal] KRIS!!", "", sNeo)
cutscene:text("* TTHE [Contractual Obligation] TO GET YOU TO THE FOUNT aIN WITH MY [[Power of Neo]]", "", sNeo)
cutscene:text("* HAS ALMOS T BEEN ! !!! HASSS A[777]MOST BEEEN !! !! !!!", "", sNeo)

cutscene:wait(3)
cutscene:shakeCamera(7)
Assets.playSound("dtrans_flip")
sNeo:setAnimation("down")

cutscene:text("* [S-Rank Completion]", "", sNeo)
cutscene:text("* BUT!!! WHAT IF I [[Specil Offer]]???", "", sNeo)
cutscene:text("* A [One-time Deal] JUST FOR [You, my little frogspawn]!!!", "", sNeo)

cutscene:text("(He’s trying something. Diplomacy, first. Be alert.)")
cutscene:text("I don’t see why I need another deal.")

            cutscene:slideToSpeed(sNeo, "otherSide", 10)
                     cutscene:look(sNeo, "left")
                sNeo:setAnimation("idle")

cutscene:wait(2)
cutscene:panTo("camera")

cutscene:text("* SEEE??? YOU WON’T NEED TO SEE WHEN YOU [Steal] THIS [Free Lunches for under]!!", "", sNeo)

                sNeo:setAnimation("aim")

                cutscene:wait(1)

                Assets.playSound("scytheburst")
                              for i = 1, 20 do
                          local burst = RudeBusterBurst("effects/rudebuster/beam_red", kris.x, kris.y, math.rad(70 + ((i - 1) * 70)), i > 9)
                         burst.layer = kris.layer + (0.01 * i)
                              kris.parent:addChild(burst)
                                   end
                        kris:setSprite("sit")

                    cutscene:wait(1)

                                    sNeo:setAnimation("idle")

cutscene:text("[speed:0.5]* BUT FIRST...", "", sNeo)

cutscene:wait(2)


cutscene:text("I thought we’d established that you had no reason to stop me, once we got here.")

cutscene:text("* YES!!!! I WANT YOU [That means YOU!] TO SEAL THE FOUNT aIN!!!", "", sNeo)

cutscene:text("* JUSTT!! JUST ONE [1] LITTLE PROBLEM,,, KRIS!!", "", sNeo)
cutscene:shakeCamera(2)
Assets.playSound("dtrans_flip")
sNeo:setAnimation("shaking")
cutscene:text("* THESE [Silly Strings!]!!", "", sNeo)

cutscene:text("* SO MUCH [Power] [Power] AND IM STILL NOT. STilLL. NOT.", "", sNeo)
cutscene:shakeCamera(2)
Assets.playSound("dtrans_flip")
sNeo:setAnimation("death")
cutscene:text("* [Hyperlink Blocked]", "", sNeo)
cutscene:shakeCamera(2)
sNeo:setAnimation("shaking")
cutscene:text("* [Hyperlink Blocked]", "", sNeo)
sNeo:setAnimation("idle")
sNeo:setAnimation("left")
cutscene:text("* LETT ME BE! !! THEY! THEYRE LIKE [Me]!!", "", sNeo)
cutscene:wait(1)
Assets.playSound("laugh")
cutscene:wait(2)

cutscene:text("*  STRINGS!! [Script Kiddies]!!! [Audience Surrogates]!!!! PUPPETS!!!!!", "", sNeo)
cutscene:text("*  BUT!! YOU!!! YOU HAVE!!!!", "", sNeo)
cutscene:shakeCamera(2)
Assets.playSound("dtrans_flip")
sNeo:setAnimation("death")
cutscene:text("* [Hyperlink Blocked]", "", sNeo)

cutscene:text("(Freedom.)")
cutscene:text("You-")
cutscene:text("Killing me won’t do anything, you know that. Both of us know that.")


cutscene:text("*  [[Kill]]???", "", sNeo)
sNeo:setAnimation("shaking")
cutscene:text("*  [[Kill]]???", "", sNeo)
sNeo:setAnimation("idle")
cutscene:text("* I WOULDN’t [Severance] A DEAL LIKE THAT, KRIS!! IM’ NOT wANT TO [[Kill]] YOU!!", "", sNeo)
cutscene:text("* I WANT TO TAKE YOU ON A [Drain] [Drain]!!", "", sNeo)

cutscene:text("(We need him to keep talking. We just need one opening.)")
cutscene:text("The machine they used to take it from you is gone.")
cutscene:text("You couldn’t drain me if you wanted to- hell, why do you want to drain me at all?")
cutscene:text("You gain no benefit from-")
Assets.playSound("laugh")
cutscene:wait(3)
sNeo:setAnimation("idle")
sNeo:setAnimation("left")
cutscene:text("* THIS [Luxury Accommodation] WAS BUILT FROM DREAMS!!! DREAMS", "", sNeo)
cutscene:text("* DREAMS FORA BODY BUILT TO TAKE A [Soul]!!!", "", sNeo)
sNeo:setAnimation("idle")
sNeo:setAnimation("aim")
sNeo:setAnimation("shaking")
cutscene:text("* 1#M A [Chick Magnet] FOR THAT LITTLE [HeartShapedObject] IN [You]!", "", sNeo)
sNeo:setAnimation("idle")
Assets.playSound("laugh")
cutscene:wait(3)
cutscene:text("… You think you can use whatever you drain to-")
kris:shake(4)
cutscene:text("Oh. Draining. Like draining into a new reservoir. Not removing the power. Transferring it.")
cutscene:text("* A LITTLE [Bank Transaction] FROm YOU TO ME, KID!!", "", sNeo)
Assets.playSound("laugh")
cutscene:wait(3)
cutscene:text("(You still have one argument he should not be able to break so easily.)")
cutscene:text("You still want to stop the Roaring.")
cutscene:text("You need me to seal the fountains in order for that to happen, Spamton.")
cutscene:text("You can’t move between the Dark Worlds. You can’t afford me dying permanently.")
sNeo:setAnimation("idle")
sNeo:setAnimation("left")
cutscene:text("* YOU!!!!! ARE C OM P LETE L;Y [Correct!]!!!", "", sNeo)
cutscene:wait(2)
cutscene:text("[speed:0.6]* BUT I’M NO [Criminal], KRIS. [Let’s Play] THIS LIKE [Civil Servants]!", "", sNeo)
sNeo:setAnimation("shaking")
cutscene:text("[speed:0.6]* IF YOU [Lost a loved one in the line of duty] I CAN [Game Over]!!", "", sNeo)
sNeo:setAnimation("idle")
sNeo:setAnimation("down")
cutscene:text("[speed:0.8]* I CAN [Exert More Willpower] ON THESE DIGS THAN YOU EVER COULD!!", "", sNeo)
cutscene:text("[speed:0.8]* IF WE’VE GOTTA [Stop this before it’s too late!] ", "", sNeo)
cutscene:text("[speed:0.8]* THEN I’M [Big]GER THAN YOU!!! WE’RE BOTH [Big Shot!] KID!!", "", sNeo)
cutscene:text("[speed:0.8]* BUT WHAT IF WE WERE ONE [1] [[BIGGER SHOT]]????", "", sNeo)

cutscene:text("No-\nI-")

cutscene:shakeCamera(3)
Assets.playSound("dtrans_flip")
sNeo:setAnimation("death")
cutscene:text("* GEEZ KID!!! “WHY ARE YOU SO GODDAMN SELFISH????", "", sNeo)
cutscene:text("* THE [Little Miss $%^£-for-brains] NEEDES YOU FOR HER [[MasterPlan]]!!!", "", sNeo)
cutscene:text("* THEYYY DIDNT [50% Off]ER ME THE [Deal of a Lifetime!]!!!", "", sNeo)
sNeo:setAnimation("shaking")
cutscene:text("* THEY JUST [[Drain]] [[Drain]] ME!!!", "", sNeo)
cutscene:text("* THEY WANT [You, yes you!] TO BE E 1! [Hyperlink Blocked] !!", "", sNeo)
cutscene:text("* NOT ME!!! NOT [Jokes For All Ages]!! NOTT [Your favourite TV show gets a new season this fall!]!!!", "", sNeo)
cutscene:text("* NOTT ANY [Any] OF THE OTHEER GUY5!!! YOU!!!!", "", sNeo)


cutscene:text("* THE [Noise Complaint].", "", sNeo)
cutscene:wait(1)
sNeo:setAnimation("idle")
sNeo:setAnimation("aim")
cutscene:text("* CANNT HAPPEN IF YOU JUST. LET ME. TAKE. THAT LITTLE [Soul] OF YOURS. JUSST LET ME ! JUST LET MEMEMEME!", "", sNeo)
cutscene:text("* NEGOTIATE A LITTLE [Arbitrage], KRIS.", "", sNeo)
sNeo:setAnimation("walk")

cutscene:text("(Think about it.)")
cutscene:text("(He engineered things so that the only viable plan...")
cutscene:text("to seal the fountain placed you in a vulnerable position.)")
cutscene:text("(Trapped by clusters of his most well-remembered points of power,")
cutscene:text("with him in the one piece of technology that could recover his abilities.)")
cutscene:text("(His final loop was one of rage, but also of strategic depth.)")
cutscene:text("(Leaving just enough of a backdoor that the machine would...")
cutscene:text("be required to seal the fountain, without making things impossible.)")
cutscene:text("(Limiting his options alongside the future you... ")
cutscene:text("so as to have the best path for him be the required path.)")
cutscene:text("(He lived his life aiming high. Buying out the lottery and playing the market.)")
cutscene:text("(With consequences, such strategies are doomed to make one a footnote.)")
cutscene:text("(But if Spamton successfully took your ability to reset...)")

cutscene:shakeCamera(3)
Assets.playSound("dtrans_flip")

cutscene:text("* KRIS!! I LIKE YOUR [Hustle and Bustle] KID!", "", sNeo)
cutscene:text("* BUT IC ANT FLOAT HERE [Unlimited Hours]!!! GIVE ME YOUR BEST OFFER!!!", "", sNeo)
cutscene:text("And if I decide that I want to keep my power?")
cutscene:text("* KRIS. I’M A [[Number 1 Rated Salesman 1997]], NOT STUPID!!!", "", sNeo)
cutscene:text("* IF YOU DONT WANT TO [Accept Kromer Transfer]... ", "", sNeo)
cutscene:text("* IL’L JSUT TAKE IT [4 FREE!!]!!!", "", sNeo)

cutscene:text("(There is one thing he does not take into account.)")
cutscene:text("(Losing your power will make the world worse, no matter how much he holds to his end of the deal.)")
cutscene:text("(You have needs. Desires. No matter what shifts occur, they will always be yours.)")
cutscene:text("(Should others twitch in their loyalty, you may always keep things right, so long as you have control.)")
cutscene:text("(Should the world be anyone else’s, they can always die the thousand little deaths.)")
cutscene:text("(Your wills may diverge, and the world shall once more become hostile. )")
cutscene:text("(Spamton may appeal to his sense of obligation, but no-one can be trusted to make things perfect.)")

sNeo:setAnimation("idle")
cutscene:text("* I REMEMBER WHEN I WAS LIKE YOU.", "", sNeo)
cutscene:text("* AMBITIOUS. CRAVING [Desire].", "", sNeo)

cutscene:text("(A world controlled by Spamton will hurt everyone...)")
cutscene:text("as he shapes the systems to funnel all love and resources towards himself.)")
cutscene:text("(In achieving that which he would desire, he will hold no sane boundaries.)")
cutscene:text("(The only one you can trust to keep everyone as safe, happy, and fulfilled as they should be...")
cutscene:text("is you.)")

cutscene:wait(3)

cutscene:text("I'm...I'm willing to cooperate.")
kris:setSprite("landed_1")

cutscene:text("* NOW FOR THE [FineAssDeals]!!", "", sNeo)
cutscene:text("The fine print is always the slime.")
cutscene:text("When you take my power...")
cutscene:text("I’d ask that you’d give me my own little corner of the world.")
cutscene:text("Just... just for me, and the people I care about. ")
cutscene:text("Some place that we can be safe, happy, and fulfilled in.")
cutscene:text("Spirit of the deal maintained alongside the letter.")

cutscene:text("* OF COURSE!! I’M NO [crooked bepis what means?]!! WHATEVER YYOU WANT, KID!", "", sNeo)
cutscene:text("* DOES THAT [Arithmetic Mean] WE HAVE A [Deal]??", "", sNeo)

cutscene:text("Yes. But first.")

cutscene:wait(2)
Assets.playSound("weaponpull_fast")
kris:setSprite("battle/intro_07")
cutscene:wait(0.5)
sNeo:setAnimation("aim")

 Assets.playSound("scytheburst")
                              for i = 1, 20 do
                          local burst = RudeBusterBurst("effects/rudebuster/beam_red", kris.x, kris.y, math.rad(70 + ((i - 1) * 70)), i > 9)
                         burst.layer = kris.layer + (0.01 * i)
                              kris.parent:addChild(burst)
                                   end
kris:setSprite("landed_1")
cutscene:wait(1)
Assets.playSound("impact")
kris:setSprite("fell")


cutscene:text("[speed:0.5]* TRYING TO [[Reset?]] KRIS?", "", sNeo)
cutscene:text("[speed:0.5]* THAT WASN’T VERY [Great Kromer Exchange Rates] OF YOU!", "", sNeo)
Assets.playSound("laugh")
cutscene:wait(3)

cutscene:text("(He is weaker. And the goal was not to win one flurry.)")
cutscene:text("(You have sewn the seeds with the tools granted to you.)")
cutscene:text("(Now let the crop sustain you.)")

cutscene:wait(1)

cutscene:shakeCamera(3)
Assets.playSound("rudebuster_hit")
sNeo:setAnimation("shaking")
        for i = 1, 8 do
            local burst = RudeBusterBurst("effects/rudebuster/beam_red", sNeo.x, sNeo.y - 50, math.rad(45 + ((i - 1) * 90)), i > 4)
            burst.layer = sNeo.layer + (0.01 * i)
            sNeo.parent:addChild(burst)
        end


                         Game.world.music:stop()

 cutscene:wait(1)


 cutscene:fadeOut(0.5)
 Assets.playSound("vineboom")

 cutscene:fadeIn(0.5)

susie.flip_x = true

  cutscene:slideTo(susie, "susie_battle", 0.01)
     cutscene:slideTo(noelle, "noelle_battle", 0.01)
     cutscene:slideTo(ralsei, "ralsei_battle", 0.01)
          cutscene:slideTo(berdly, "berdly_battle", 0.01)


     ralsei:setAnimation("battle/idle")

     cutscene:wait(2)

     cutscene:text("[facec:smug][voice:berdly]* Surely you did not\nbelieve that\nI would leave...")
   cutscene:text("[facec:smug][voice:berdly]* ...my ally alone with\nyou of all people!")

     cutscene:text("(Act like you expected this.)")
     cutscene:text("Thanks for taking the opening.")

    cutscene:text("(Susie's arm muscles are tense. Scraps of cloth stuck on her wristbands.)")
          cutscene:text("(She threw the party across the gap, and was pulled up on the other side in turn.)")
          cutscene:text("(Or they all teleported here with a vineboom...)")


     cutscene:text("* Kris! We're here!", "smile", "noelle")
     kris:setSprite("landed_1")
     cutscene:text("* Kris! If we attack the wires, he’ll have nothing to keep him up!", "smile", "ralsei")


      cutscene:text("[He specifically asked for NO pickles]!!!", "", sNeo)
      cutscene:text("AND YET HERE THEY ARE!! THE [Vinegar-Coated Gherkins] THEMSELVES!!!!", "", sNeo)


      Assets.playSound("laugh")
      cutscene:wait(3)



    Game:addPartyMember("noelle")
     Game:addPartyMember("susie")
     noelle = noelle:convertToFollower()

     susie = susie:convertToFollower()

         cutscene:slideTo(sNeo, "outOfSight", 0.01)

         if Game:getFlag("noHit") then

          cutscene:startEncounter("noHitSpamtonNeo", true)
                    else
                        cutscene:startEncounter("spamtonNeo", true)
                    end
    

 else


 cutscene:fadeOut(0)


           cutscene:slideTo(berdly, "berdly_battle", 0.01)


      cutscene:slideTo(susie, "susie_battle", 0.01)
      cutscene:slideTo(noelle, "noelle_battle", 0.01)
      cutscene:slideTo(ralsei, "ralsei_battle", 0.01)
          cutscene:slideTo(kris, "krisLand", 0.01)
               cutscene:slideTo(sNeo, "otherSide", 0.01)


      cutscene:panTo("camera")


      ralsei:setAnimation("battle/idle")

      ralsei.flip_x = true

      cutscene:wait(2)



      Game:addPartyMember("noelle")
     Game:addPartyMember("susie")
     --Game:addPartyMember("berdly")
     --Game:addPartyMember("ralsei")


     susie = susie:convertToFollower()
        noelle=   noelle:convertToFollower()
       --  berdly =  berdly:convertToFollower()
        --  ralsei = ralsei:convertToFollower()
 cutscene:fadeIn(1)

  cutscene:text("[facec:smug][voice:berdly]* Surely you did not\nbelieve that\nI would leave...")
   cutscene:text("[facec:smug][voice:berdly]* ...my ally alone with\nyou of all people!")

   Game:setFlag("bulletToggleCustom", false)


  cutscene:text("[He specifically asked for NO pickles]!!!", "", sNeo)
       cutscene:text("AND YET HERE THEY ARE!! THE [Vinegar-Coated Gherkins] THEMSELVES!!!!", "", sNeo)

                cutscene:slideTo(sNeo, "outOfSight", 0.01)

                if Game:getFlag("noHit") then

      cutscene:startEncounter("noHitSpamtonNeo", true)
                else
                    cutscene:startEncounter("spamtonNeo", true)
                end



      end

      --all ending sequences here

      if Game:getFlag("bulletToggleCustom") then

          local mari = cutscene:getCharacter("mariNeo")
          local spamton = cutscene:getCharacter("spamton")

          mari:setAnimation("death")


          Game.world.music:play("my_time")

          cutscene:slideTo(mari, "mariReturn", 0.01)

          cutscene:text("SPAMTON'S party was victorious!")
          cutscene:text("You gained 0 EXP!")
          cutscene:text("You got 0 CLAMS!")

          if Game:getFlag("noHit") then

               cutscene:text("[voice:mari][font:omori]* What a little NO-Hit sweat you are...")
               cutscene:text("[voice:mari][font:omori]* Nice job. Now go no-life some FDY games...")
               cutscene:text("[voice:mari][font:omori]* Because...")

          end

          cutscene:text("[voice:mari][font:omori]* All that and I still...")

          cutscene:text("[voice:sneo]* YOU THOUGHT YOU COULD GO [Toe To Toe] WITH THE [Big Shot!]")
          cutscene:text("[voice:sneo]* THAT LITTLE STRING...")
          cutscene:text("[voice:sneo]* IT'S ABOUT TO SNAP!")
         
         
          mari:setAnimation("shaking")

          cutscene:text("[voice:mari][font:omori][shake:2]* All my freedom...")
          cutscene:text("[voice:mari][font:omori]* Keeping up with all this isn't so easy.")
          cutscene:text("[voice:mari][font:omori]* I think I pushed myself too hard.")
          cutscene:text("[voice:mari][font:omori][shake:2]* I worked so hard to get to this point.")
          cutscene:text("[voice:mari][font:omori]* And here it all falls.")

          cutscene:text("[voice:sneo]* UH- ARE YOU...")

          mari:setAnimation("death")

          cutscene:text("[voice:mari][font:omori][shake:2]* My last waltz could have been perfect. They would be watching!")
          cutscene:text("[voice:mari][font:omori]* No more giving the cold shoulder! Heh.")
          cutscene:text("[voice:mari][font:omori]* I thought that if I'd held onto this power, then everything...")
          cutscene:text("[voice:mari][font:omori][shake:2]* I'm sorry SUNNY.")
          cutscene:text("[voice:mari][font:omori][shake:2]* There's just one thing left to do.")
          cutscene:text("[voice:mari][font:omori]* Know that I'll always be watching over you, okay?")

          cutscene:text("[voice:sneo]* SUNNY? YOU'VE GOT THE WRONG PERS-")

          mari:setAnimation("idle")


          cutscene:text("[voice:mari][font:omori]* SPAMTON!", "default", mari)
          cutscene:text("[voice:mari][font:omori]* YOU WANT THE [Smooth Taste Of NEO]! Right?", "default", mari)

          cutscene:text("[voice:sneo]* YOU BET YOURSELF I DO!")

          cutscene:text("[voice:mari][font:omori][shake:2]* WELL I'M OFFERING UP A VERY SPECIL DEAL!", "default", mari)
          cutscene:text("[voice:mari][font:omori]* WANT IT?", "default", mari)

          cutscene:text("[voice:sneo]* THIS ISN'T A [Final Gambit]? NO STRINGS ATTACHED?")

          cutscene:text("[voice:mari][font:omori]* NOPE!", "default", mari)

          cutscene:text("[voice:sneo]* WELL, THEN! I ACCEPT!")

          mari:setAnimation("shaking")

          cutscene:text("[voice:mari][font:omori][shake:2]* MAKE ME A FREE GIRL!", "default", mari)
          cutscene:text("[voice:mari][font:omori]* So can I finally be with him again...")

          cutscene:text("[voice:sneo]* SAY LESS! A PLEASURE TO NOT SEE YOU EVERY AGAIN!")

          cutscene:text("[voice:mari][font:omori]* Do it.")
          
          cutscene:text("Spamton snapped strings!")



          Assets.playSound("omori_hit", 1, 0.75)

     

               Assets.playSound("laugh", 1, 0.90)



          mari.sprite:snapStrings(1, true)

          cutscene:wait(2)

          Assets.playSound("deathnoise", 1, 0.75)
                  local alphafx = mari:addFX(AlphaFX(1))
                  Game.world.timer:tween(1, alphafx, {alpha = 0})

                  cutscene:wait(2.5)
                  mari:remove()

                  cutscene:wait(2)
                  cutscene:text("[voice:sneo]* I GOT THE [shake:2]PerfectShades.")


                  cutscene:fadeOut(3)

                  cutscene:text("[voice:sneo]* IT FEELS GOOD TO BE [Back In the Driver's Seat] AGAIN!")
                  cutscene:text("[voice:sneo]* A [Heaven-Piercing] BODY BACK IN MY GRASP AGAIN!")
                  cutscene:text("[voice:sneo]* I THINK IT'S ABOUT TIME FOR A [Test Drive]!")

                  cutscene:wait(1)

                  Assets.playSound("boost")
               Assets.playSound("weWon", 1, 0.90)


               Assets.playSound("laugh", 1, 0.75)
               cutscene:wait(3)
               cutscene:text("Hold escape to return to the main menu.")


      else

            cutscene:detachFollowers()

cutscene:fadeOut(0)
susie:setSprite("shock_left")
noelle:setSprite("kneel_shocked_right")
ralsei:setSprite("fall")


     cutscene:slideTo(spamton, "spamtonDefeat", 0.01)
     Game.world.music:play("wind_highplace")

 cutscene:fadeIn(3)

  cutscene:text("[speed:0.5]… hello? Can anyone..?", "", sNeo)
  cutscene:text("[speed:0.5]… All that, and I couldn’t even…?", "", sNeo)
  cutscene:text("[speed:0.5]… I never lied. I really did care for…", "", sNeo)
  cutscene:text("[speed:0.5]… Perhaps I could still live those desires through…", "", sNeo)
  cutscene:text("[speed:0.5]… A values handshake. I become your tool…", "", sNeo)
  cutscene:text("[speed:0.5]… And you get the strength to be free…", "", sNeo)

  cutscene:wait(2)

   Assets.playSound("deathnoise", 1, 0.75)
                  local alphafx = spamton:addFX(AlphaFX(1))
                  Game.world.timer:tween(1, alphafx, {alpha = 0})



                  cutscene:wait(2.5)
                  spamton:remove()

                  cutscene:wait(2)
Assets.playSound("ominous_cancel")
cutscene:text("(You got the Dealmaker.)")
Assets.playSound("noise", 1, 0.75)
kris:shake(2)
kris:setSprite("sit")
cutscene:wait(2)
cutscene:text("(Allow this to happen, while you are safe.)")
cutscene:text("...", "concern", "ralsei")
cutscene:text("(It will be okay. There is a time to fight, and a time to rest.)")
Assets.playSound("noise", 1, 0.75)
ralsei:shake(2)
ralsei:setSprite("landed_1")
cutscene:wait(2)
cutscene:text("(The former cannot be done right without the latter.)")
cutscene:text("...", "neutral_side", "susie")
cutscene:wait(1)
Assets.playSound("noise", 1, 0.75)
susie:shake(2)
susie:setSprite("away_turn")
cutscene:wait(2)
cutscene:text("(You need only seal the fountain when you are ready.)")
cutscene:wait(1)
Assets.playSound("noise", 1, 0.75)
noelle:shake(2)
noelle:setSprite("walk_sad/down_1")
cutscene:wait(4)
cutscene:text("...", "shock_b", "noelle")
cutscene:text(".....", "dejected", "noelle")
cutscene:text(".......", "down", "noelle")
cutscene:text("(You are allowed to be scared. She is allowed to be scared.)")
cutscene:text("(How you handle that fear is the mark of a person’s will.)")
Assets.playSound("noise", 1, 0.75)
noelle:shake(2)
noelle:setSprite("head_lowered_look_left")
cutscene:wait(2)
cutscene:text("(...)")
cutscene:text("(And your wills are indomitable, in the long term.)")

cutscene:fadeOut(5)

Game.world.music:stop()


--Game.world.music:play("mod_menu")

cutscene:text("* (Planning for the future in castle town.)")

cutscene:text("[voice:berdly]* How shall we...that is, there must be some method of...")
cutscene:text("[voice:berdly]* Removing them from the playing field...")
cutscene:text("[voice:berdly]* Should they be at our mercy.")

cutscene:text("[voice:berdly]* Yet, we won't always be lucky enough to disable them..")
cutscene:text("[voice:berdly]* ...and make them harmless.")

cutscene:text("With Darkners...")
cutscene:text("We have the very specific luxury of being able to take them out non-lethally...")
cutscene:text("And a luxury even greater than that of being nominally on their side...")
cutscene:text("In all prior cases, they’ve been tricked or forced into fighting us.")

cutscene:text("[voice:berdly]* And we should expect more of the same, yes.")
cutscene:text("[voice:berdly]* For Darkners, I understand that all combats...")
cutscene:text("[voice:berdly]* ...should be committed to with the goal of not slaying the opposition.")

cutscene:text("[voice:berdly]* Save for… Spamton, I suppose.")

cutscene:wait(2)

cutscene:text("(It was only akin to death in its consequences, after all.)")

cutscene:text("Even for Darkners, it’s a luxury.")

cutscene:text("Spamton… Spamton couldn’t be helped.")
cutscene:wait(2)

cutscene:text("[shake:1]It still doesn’t feel real, in some respects. ")

cutscene:wait(2)

cutscene:text("* You can quit out now by holding escape.")
      end

end,


 start_fight_testing = function(cutscene, event)

 local sNeo = cutscene:getCharacter("spamtonneo")
     local kris = cutscene:getCharacter("kris")
     local ralsei = cutscene:getCharacter("ralsei")
     local susie = cutscene:getCharacter("susie")
     local noelle = cutscene:getCharacter("noelle")
     local berdly = cutscene:getCharacter("berdly")


cutscene:fadeOut(0)


          cutscene:slideTo(berdly, "berdly_battle", 0.01)


     cutscene:slideTo(susie, "susie_battle", 0.01)
     cutscene:slideTo(noelle, "noelle_battle", 0.01)
     cutscene:slideTo(ralsei, "ralsei_battle", 0.01)
         cutscene:slideTo(kris, "krisLand", 0.01)
              cutscene:slideTo(sNeo, "otherSide", 0.01)


     cutscene:panTo("camera")


     ralsei:setAnimation("battle/idle")

     ralsei.flip_x = true

     cutscene:wait(2)



     Game:addPartyMember("noelle")
     Game:addPartyMember("susie")
     Game:addPartyMember("berdly")
     Game:addPartyMember("ralsei")


     susie:convertToFollower()
          noelle:convertToFollower()
          berdly:convertToFollower()
          ralsei:convertToFollower()

cutscene:fadeIn(1)

 cutscene:text("[facec:smug][voice:berdly]* Surely you did not\nbelieve that\nI would leave...")
  cutscene:text("[facec:smug][voice:berdly]* ...my ally alone with\nyou of all people!")



 cutscene:text("[He specifically asked for NO pickles]!!!", "", sNeo)
      cutscene:text("AND YET HERE THEY ARE!! THE [Vinegar-Coated Gherkins] THEMSELVES!!!!", "", sNeo)
      cutscene:text("READY TO TRY AND NO HIT ME????????", "", sNeo)


      Assets.playSound("laugh")
      cutscene:wait(3)

               cutscene:slideTo(sNeo, "outOfSight", 0.01)



     cutscene:startEncounter("noHitSpamtonNeo", true)

end,

 omori = function(cutscene, event)

     cutscene:fadeOut(0)

     local kris = cutscene:getCharacter("kris")
  local mari = cutscene:getCharacter("mariNeo")
     local spamton = cutscene:getCharacter("spamton")

     kris:remove()
     Game:removePartyMember("kris")

     Game:addPartyMember("spamton")

     spamton = spamton:convertToPlayer()


     cutscene:slideTo(spamton, "omori", 0.01)


     spamton:setSprite("idle/up")

     Game.world.music:play("fear", 17, 4)

     mari:setAnimation("shaking")

     cutscene:fadeIn(1)

          cutscene:text("[voice:mari][font:omori]* ANOTHER CHANCE AT PERFECTION!", "default", mari)


     mari:setAnimation("death")
     cutscene:text("[voice:mari][font:omori]* AND ALL IT COSTS IS YOUR...", "default", mari)
     cutscene:shakeCamera(10)

     Assets.playSound("vineboom")
     cutscene:text("[voice:mari][speed:0.5][font:omori][shake:3]* [h e a r t  s h a p e d  o b j e c t]")
     mari:setAnimation("idle")

     cutscene:text("[voice:mari][shake:2][font:omori]* GREAT [Heavens]! IT'S ALMOST TIME FOR THIS BIG SISTER'S COMEBACK PERFORMANCE!", "default", mari)


     cutscene:text("[voice:mari][font:omori]* [Just For You!] I'M HOSTING A VERY [Specil] RECITAL...", "default", mari)

          mari:setAnimation("aim")


     cutscene:text("[voice:mari][font:omori]* THE LAST RECITAL OF YOUR [DeeplyUnclean] LIFE!", "default", mari)
     mari:setAnimation("shaking")

     Assets.playSound("smile_heaven")

     cutscene:wait(3)



    mari:explode()

      cutscene:startEncounter("mariNeo", true)

end,

}
