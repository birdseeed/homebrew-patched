cask "patched" do
  version "0.4.0"
  sha256 "911b07efd3822c34fc30a30721ee26f93cffab2baa42e6c9152343160c3d830d"

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
