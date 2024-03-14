export const ImageWindow = () =>
  Widget.Window({
    name: "image-window",
    visible: false,
    layer: "background",
    anchor: ["bottom"],
    // TODO: make this change dynamically or something 
    child: Widget.Box({
      css: 'background-image: url("/home/kevin/dotfiles/wallpapers/michael.png");',
      className: "image-box",
    }),
  });
