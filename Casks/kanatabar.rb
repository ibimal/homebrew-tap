cask "kanatabar" do
  version "0.1.1"
  sha256 "849db43e0d571eb3b018e285d3c0192ed8a804c886704079dc238ab5912fee6a"

  url "https://github.com/ibimal/kanatabar/releases/download/v#{version}/KanataBar-#{version}.pkg"
  name "KanataBar"
  desc "Supervisor and menu bar app for the kanata keyboard remapper"
  homepage "https://github.com/ibimal/kanatabar"

  depends_on macos: :ventura

  pkg "KanataBar-#{version}.pkg"

  uninstall script:  {
              executable: "/usr/local/bin/kanatactl",
              args:       ["uninstall"],
              sudo:       true,
            },
            pkgutil: "io.github.ibimal.kanatabar"

  caveats <<~EOS
    KanataBar requires kanata and the Karabiner-DriverKit-VirtualHIDDevice
    driver; the menu bar Setup Wizard walks you through installing both and
    granting the needed permissions.

    KanataBar is not notarized (no paid Apple Developer account — see the
    project README). If macOS blocks it, allow it under System Settings →
    Privacy & Security → "Open Anyway".

    brew upgrade is the only update mechanism; the app never self-updates.
  EOS
end
