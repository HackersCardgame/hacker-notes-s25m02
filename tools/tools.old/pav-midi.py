import os
import mido
import pulsectl

RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
DEFAULT = "\033[0m"

i = 0

print(f"{BLUE}Midi-Eingänge{DEFAULT}:")
for port in mido.get_input_names():
  print(RED + str(i) + ": " + DEFAULT + port)
  i += 1

print()
print()
print()
print()
print(f"{BLUE}Midi-Ausgänge{DEFAULT}:")
for port in mido.get_output_names():
  print(RED + str(i) + ": " + DEFAULT + port)
  i += 1

pulse = pulsectl.Pulse("my-client")
sources = pulse.source_list()
sink_inputs = pulse.sink_input_list()
sinks = pulse.sink_list()

print(f"{YELLOW}PulseAudio-Eingänge{DEFAULT}:")
for source in sources:
  print(f"{RED}{source.index}{DEFAULT}: {source.name}")


print(f"{YELLOW}PulseAudio-sinks{DEFAULT}:")
for sink_input in sink_inputs:
  print(f"{RED}{sink_input.index}{DEFAULT}: {sink_input.proplist['application.name']}, -- {sink_input.volume}")

print(f"{YELLOW}PulseAudio-Ausgänge{DEFAULT}:")
for sink in sinks:
  print(f"{RED}{sink.index}{DEFAULT}: {sink.name}")


pulse.volume_set_all_chans(872, pulsectl.PulseVolumeInfo([0.1] * 2))

x="""
def set_volume(source_index, volume) :
os.system(f"pactl set-source-volume {source_index} {int(sink.volume.value * 100)} {sink.active}" )

# Set up your MIDI input device (adjust accordingly)
midi_input = mido.open_input('Your MIDI Device Name')

for msg in midi_input:
if msg.type == 'control_change' # Filter for fader controls
volume = int(msg.value * 10@ / 127) # Convert MIDI value (0-127) to percentage (0-100)
set_volume(®@, volume) # Here source_index @ is used, adjust as necessary"""
