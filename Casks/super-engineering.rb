# frozen_string_literal: true

cask "super-engineering" do
  version "797a71c8"
  sha256 "c9108aab86da079567e937fcf86cf2022c57823b43005a6d5c7a2e4dc7f3973e"

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
