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

  uninstall quit: "im.patched.app"

  zap launchctl: "im.patched.check",
      trash:     [
        "~/Library/Application Support/.patched-state-migration.json",
        "~/Library/Application Support/.patched-state-migration.lease",
        "~/Library/Application Support/.patched-state-migration.lock",
        "~/Library/Application Support/mac-updater",
        "~/Library/Application Support/Patched",
        "~/Library/Caches/im.patched.app",
        "~/Library/Caches/mac-updater",
        "~/Library/Caches/Patched",
        "~/Library/HTTPStorages/im.patched.app",
        "~/Library/LaunchAgents/im.patched.check.plist",
        "~/Library/Logs/Patched",
        "~/Library/Preferences/im.patched.app.plist",
        "~/Library/Saved Application State/im.patched.app.savedState",
      ]
end
