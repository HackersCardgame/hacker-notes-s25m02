# pri2025

### updating to debian <s>bookworm</s> trixie
Sat Dec 7 03:01:16 AM CET 2024 Linux localhost 6.11.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.11.10-1 (2024-11-23) x86_64 GNU/Linux

## DISCLAMER:
i dont pirate software, movies or music, i just found it funny to programm such a big software. i mean if pirates use Microsoft Windows nobody would sue Microsoft because of that i guess

## ABOVE ABOVE TOP SECRET
first bigger busts of WAREZ and Trader ScENE was about 2010. It's not about poor people in hollywood that were betrayed because of lincese fees. ThE ScENE is a large content distribution network with tech savy people. Reasion is in my SUBJECTIVE opinion that miliaries all over the globe not just have a global assessionation grid but also a global censorship grid. if militaries kill inocent people all over the globe it implies that there is also some sort of censorship infrastructure. often privatized, eg insurance companies that also have insurance for protecting people against legitimate lawsutes.

this censorship infrastructure seems to work based on hash valuse of files that were already indexed. and as soon as one tries to copy, analyze or send such a file to officials (z.B FEDPOL in Switzerland) it automatically enables functions like ICD10 G40.2 on different strenghts. So the reason why autistic people have autistic helmets. maybe this infrastructure also targets federal officers.

And it is likely that it has a quite easy to use API / GUI for violent but not that intelligent people, eg. 

* has an officers degree in Swiss Army
* throws the file in the recycle bin on his windows

-> what would activate global destruction of that file based on hash value

also likely that since the INTEL CPU with built in WiMax that there is some sort of secont network, so if you computer is completely air gapped they can still censor things the would bring murderer with officers degree of local army into civil curt and into prison. the censorship "feature" seems to delete eg. images i made from my employees and replace them with really lot of junk files (eg. small but a lot images of buttons from websites) and really ugly and annoying adult content. Further the also transmitted if i dont make (non ugly) content from me for the only girl-friend i ever had ... and this after they "reporgrammed" me in mental instituition Psychiatrie Königsfelden in the canton of aargau. if you look at the timeline of my photos even a kid would recognize that. so people that shall be scensored since they are whitness for murderer are degraded to a peace of meat like me by the age of about 30. wirst case they even bought my so called parents to help censor and sabotage me, and in the end it would look like a family drama if i die and nobody would ask further questions about the global censorship infrastructure, because JUST A FAMILY DRAMA with two pedophile old 1950 (p)arent's

Further there seems to be some sort of apartement wide WiMax Broadcast message: "Sabotage all backup devices now" eg. CD-Rom Burner ... it includes my positional data, even my EEG and the algorithm triest to force me to do at least one mistake by myself for later "blaming the user" card. as soon blaming the user can be played people would not investigate further on. technically, i guess someone sabotaged buring dual layer dvd roms, and all devices they know i own (serial nummber) are also sabotaged. possibly the reason why the poice officer took photos of all my harddisks in my UBS Aarau deposit, he said "We must controll that marc jr does not have fire-arms in his bank deposit" <- so again using the terrorist narrative for censorship. since i know that i burnt about 10 dual layer dvd with couchsofa tracks from archive.org as an additional backup on the new sata DVD Burner, it must be A) the brasero .deb from debian trixie, B) sabotaged eg. by device serial number / firmware ... but doing it in command line instead of brasero seems to work

2013 they took me from my bedroom with a armed swat from KantonsPolizei Aargau Posten West, called me an alkaida terrorist, but they knew anyway that not i am the terrorist. Switzerland is on the 6st topmost place of 180 coutries in the US corruption list. likely that most police officers and judges make their money with glossing over crime and likey that compared to it's population that much global companies have their headquaters in switzerland is because of that. Then the brought me to mental institution Königsfelden that is attachet to the same 10.0.0.0/16 like the police stations or eg the tax buro of canton aargau. gave me that much neuroleptics like never before so that in curt i was stupid as a peace of bread. MEME: original swiss idiot sandwich

neuroleptics are possibly just a part of the things they do, i think i am a unwilling lab rat of university of basel that has a project to delete memories. they say that this would be good for rape vitims so that they dont trigger to suicide attempts anymore, but that's possibly just a lie.

as soon one has something like more than one neuralink they can deactivate certain regions of the brain with noise, and decide where specific they would like to store certain information(s) in my brain (Segmentation)

eg if i type ssh-keygen the segmentation is automatically enabled, stores the password for the key in a certain area of the brain and then 24h while i am sleeping they erase this area. so i would need to note down passwords, and that's maybe not the best idea.

EventTrigger: ssh-keygen ???
============
-> see hackerscardgame.org/2 for things about illegal military neuro-implant research in switzerland since 1950 ...

# installation ...
As root
1. run Prerequisites, tested on debian buster, bullseye ... no guarantee that you dont have to fix things since things change
2. run ./tools/install/setup.sh
3. run make in ./
4. run unittests.sh in ./
5. have a look at the code
6. make 
7. make install-client installs the client to the system
8. make install-server installs the server to the system (needs 6+ Core!) as a service you can run with systemctl
9. to get the first user with password see server/hashPassword_unittest.cpp and use mysql command to create one (puzzle)

you need the modified cb-ftp: https://github.com/HackersCardgame/cbftp-r983, needs also to be compilet, has also a prerequisistes.sh, the repo is somehow broken, so maybe you need to use the https://github.com/HackersCardgame/cbftp and apply the patch from r983 if the patch still works or then you need to modify manually (C/C++)

initial User ist user02 with password 123456, password is hashed in the database, you can have a look at ./pri2022/src/server/hashPassword_unittest.cpp to see how you need to create the right hash

in the /bin directory run
./phaseClient user02 123456

but first you need to start the server also in the bin directory or you can install the server as systemD startup thingie with make command [1]
./pri2022/bin/startServer.sh 


[1] https://github.com/HackersCardgame/pri2022/blob/main/Makefile#L204-L219
