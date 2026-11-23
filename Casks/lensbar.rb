cask "lensbar" do
  version "0.2.1"

  on_arm do
    url "https://github.com/andrew-craig/lensbar/releases/download/v#{version}/LensBar.dmg"
    sha256 "e27650124f5302c730134b03b87e77fc46c304c70566be7c86dc0909858832c7"
  end

  on_intel do
    url "https://github.com/andrew-craig/lensbar/releases/download/v#{version}/LensBar-universal.dmg"
    sha256 "3a3419c7634563540f91246b092665b8dada22a818cf88c6ac46e5afb0925fc1"
  end

  name "LensBar"
  desc "Menu-bar app for controlling UVC webcams"
  homepage "https://github.com/andrew-craig/lensbar"

  depends_on macos: ">= :sonoma"

  app "LensBar.app"

  uninstall quit: "com.andrewcraig.LensBar"

  zap trash: [
    "~/Library/Preferences/com.andrewcraig.LensBar.plist",
  ]

  caveats <<~EOS
    LensBar Camera (the optional virtual camera) is a system extension.
    Remove it in LensBar (menu-bar icon → "Remove LensBar Camera…") BEFORE
    running `brew uninstall`; deleting the app alone can leave the extension
    registered. To check, run:
      systemextensionsctl list
  EOS
end
