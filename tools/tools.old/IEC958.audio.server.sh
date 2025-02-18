aplay /usr/share/lmms/samples/shapes/*.wav

aplay -l |grep ICU
# card 2: ICUSBAUDIO7D [ICUSBAUDIO7D], device 0: USB Audio [USB Audio]

aplay -L |grep IEC -B2
#iec958:CARD=ICUSBAUDIO7D,DEV=0
#    ICUSBAUDIO7D, USB Audio
#    IEC958 (S/PDIF) Digital Audio Output

#Dann hat diese Soundkarte irgend 10€ kostet NUR einen Digtalen Eingang, und man muss da zwiscdhen Mic, Linue und IEC958 In > > UMSCHALTEN < <
amixer -c 2 get "PCM Capture Source"
#Simple mixer control 'PCM Capture Source',0
#  Capabilities: enum
#  Items: 'Mic' 'Line' 'IEC958 In' 'Mixer'
#  Item0: 'Line'    <<<----- DAS HIER IST FALSCH, also muss man das umschalten
amixer -c 2 set "PCM Capture Source" 'IEC958 In'

#dann eim zeiten SPDIF / TOSLINK Eingang auch (was die 3. Soundkarte ist was man mit aplay -l sieht)
amixer -c 3 get "PCM Capture Source"
amixer -c 3 set "PCM Capture Source" 'IEC958 In'

#dann den jackd grad mit -s starten
/usr/bin/qjackctrl -s &
# da habe ich zuvor das Logitech Light-Speed G435 Headset als Primäre Soundkarte eingestellt ohne -s
# Lightspeed hat auch option wie logitech unify tastaturen und mäuse anzuschliessen, welche dann WEISS DER TEUFEL vielleicht was machen wenn man grad nicht am PC ist, sollen die Offiziers-Trottel ähm ich meine die Trottel mit OffiziersTitel auf dem Raspberry herumfummeln

# also ist auch irgendwie ein sicherheits-enhancemet

echo "waiting 5 Seconds for qJackCtl to start up ..."
sleep 5



# Das hier ist die onboard soundkarte für die billigen Funkkopfhörer mit schlechtem Frequenzgang, zum Musik MACHEN eher suboptimal 
/usr/bin/alsa_out -j "onboard_out" -d hw:0 -r 48000 &

which alsa_in
alsa_in -j "toslink1_in" -d hw:2 -r 48000 &

alsa_in -j "toslink2_in" -d hw:3 -r 48000 &

