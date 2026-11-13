cask "patched" do
  version "0.2.2"
  sha256 "5189992ef86347a7cd1422c9def743c228d6540d86fc7c24c069d354ee34d14c"

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
