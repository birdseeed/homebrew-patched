cask "patched" do
  version "0.5.1"
  sha256 "0057770c0b937ef71e25ff77a1989da39051fff9e65ed73b049ec2f5b5b688ba"

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
