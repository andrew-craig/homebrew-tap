cask "lensbar" do
  version "0.1.8"

  on_arm do
    url "https://github.com/andrew-craig/lensbar/releases/download/v#{version}/LensBar.dmg"
    sha256 "38c3e667c5c8956e24ecafcbb551acb03bbb9f1d5f1fc9b5d3b4cfacb1bd43fa"
  end

  on_intel do
    url "https://github.com/andrew-craig/lensbar/releases/download/v#{version}/LensBar-universal.dmg"
    sha256 "4bae489eede14b07509a7d6e4d4e99509a834e59dc27b11457f87297b5eaba3d"
  end

  name "LensBar"
  desc "Menu-bar app for controlling UVC webcams"
  homepage "https://github.com/andrew-craig/lensbar"

  depends_on macos: ">= :sonoma"

  app "LensBar.app"

  zap trash: [
    "~/Library/Preferences/com.andrewcraig.LensBar.plist",
  ]
end
