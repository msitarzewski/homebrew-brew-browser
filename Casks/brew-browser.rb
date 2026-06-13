cask "brew-browser" do
  version "0.5.1"
  sha256 "472885fde3ecc6bad30fdf2c961c9186437ab4e50a94d4174fbea46de25f6001"

  url "https://github.com/msitarzewski/brew-browser/releases/download/v#{version}/brew-browser_#{version}_aarch64.dmg",
      verified: "github.com/msitarzewski/brew-browser/"
  name "brew-browser"
  desc "Native GUI for Homebrew"
  homepage "https://brew-browser.zerologic.com/"

  # auto_updates true: brew-browser has an in-app updater (Settings →
  # Network → Updates, off by default). This tells brew the app updates
  # itself so `brew upgrade` won't fight version drift when a user
  # self-updates. The cask version + sha256 are ALSO bumped every release
  # so `brew upgrade --cask` users stay current (Homebrew 5.2.0+
  # auto-upgrades auto_updates casks when the tap version is newer).
  #
  # depends_on macos: :ventura declares Ventura or newer on Homebrew 6.0+.
  # Add `depends_on maximum_macos:` separately if an upper bound is ever needed.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura
  app "brew-browser.app"

  zap trash: [
    "~/Library/Application Support/brew-browser",
    "~/Library/Caches/com.zerologic.brew-browser",
    "~/Library/HTTPStorages/com.zerologic.brew-browser",
    "~/Library/Preferences/com.zerologic.brew-browser.plist",
    "~/Library/Saved Application State/com.zerologic.brew-browser.savedState",
    "~/Library/WebKit/com.zerologic.brew-browser",
  ]
end
