cask "patched" do
  version "0.1.9"
  sha256 "24fcf4a48ffc88259fa999142b0007de423987f048d8dcdda372d3abafe8b33e"

  url "https://github.com/birdseeed/patched/releases/download/v#{version}/Patched-#{version}.dmg"
  name "Patched"
  desc "Free, open source app updater that verifies each update before installing"
  homepage "https://patched.im/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Patched.app"
  binary "#{appdir}/Patched.app/Contents/Helpers/patched"

  zap trash: [
    "~/Library/Application Support/Patched",
    "~/Library/Caches/Patched",
    "~/Library/Preferences/im.patched.app.plist",
  ]
end
