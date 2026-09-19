# frozen_string_literal: true

cask "super-engineering" do
  version "5a38b77f"
  sha256 "7d33d3d563d87ffd693464e9e611235de78bafd3e1547e47a565db77d91b89a4"

  url "https://releases.superconductor.so/nightly/Superconductor-nightly-#{version}-arm64.dmg"
  name "super.engineering"
  desc "Native workspace for running parallel AI coding agents"
  homepage "https://super.engineering/"

  livecheck do
    url "https://super.engineering/api/download"
    strategy :header_match do |headers|
      match = headers["location"].to_s.match(%r{/Superconductor-nightly-([0-9a-f]+)-arm64\.dmg\z})
      match[1] if match
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "super.engineering.app"
end
