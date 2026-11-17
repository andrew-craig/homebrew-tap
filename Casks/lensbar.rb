cask "lensbar" do
  version "0.2.0"

  on_arm do
    url "https://github.com/andrew-craig/lensbar/releases/download/v#{version}/LensBar.dmg"
    sha256 "2d72252b212b54c8c9ad1042402b9fdfd062f7ed92813a6511a0bfa34316402f"
  end

  on_intel do
    url "https://github.com/andrew-craig/lensbar/releases/download/v#{version}/LensBar-universal.dmg"
    sha256 "fb3b57a948bea67fc1fdfee70e3643c51ed729637c5e35043e8008e60d613b2f"
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
