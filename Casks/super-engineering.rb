# frozen_string_literal: true

cask "super-engineering" do
  version "a1c288b6"
  sha256 "6869c7fb6515b9e28f863d1c81d2ea63f288958418a088ec55b58e31a733e039"

  url "https://releases.super.engineering/nightly/super.engineering-nightly-#{version}-arm64.dmg"
  name "super.engineering"
  desc "Native workspace for running parallel AI coding agents"
  homepage "https://super.engineering/"

  livecheck do
    url "https://super.engineering/api/download?arch=arm64"
    strategy :header_match do |headers|
      match = headers["location"].to_s.match(%r{/super\.engineering-nightly-([0-9a-f]+)-arm64\.dmg\z})
      match[1] if match
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "super.engineering.app"
end
