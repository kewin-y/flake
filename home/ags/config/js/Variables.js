import Variable from "resource:///com/github/Aylur/ags/variable.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";

export const uptime = Variable(0, { poll: [60000, "uptime -p"] });

export const speakerIcon = () => {
  const category = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  const icon = Audio.speaker.stream?.is_muted
    ? 0
    : [101, 67, 34, 1, 0].find(
      (threshold) => threshold <= Audio.speaker.volume * 100,
    );

  return `audio-volume-${category[icon]}-symbolic`;
};

export const microphoneIcon = () => {
  const category = {
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  const icon = Audio.microphone.stream?.is_muted
    ? 0
    : [67, 34, 1, 0].find(
      (threshold) => threshold <= Audio.microphone.volume * 100,
    );

  return `microphone-sensitivity-${category[icon]}-symbolic`;
};
