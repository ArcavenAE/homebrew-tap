# Homebrew formula for bloomctl
# Single channel, kos pattern: updated by CI on every push to main
# (alpha-... versions) and on v* tags (stable versions). The same
# formula tracks the latest published artifact, alpha or stable.
# macOS only (arm64). Linux support is a future option.

class Bloomctl < Formula
  desc "Spec-driven CLI for the iru (Kandji) Endpoint Management API"
  homepage "https://github.com/ArcavenAE/bloomctl"
  version "alpha-20260916-091940-0d0ac44"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/bloomctl/releases/download/alpha-20260916-091940-0d0ac44/bloomctl-darwin-arm64"
    sha256 "5de7bd85e98b45b4a9e3a4cdaafbb818d65c99229d2e49abf2202792d7fa7e43"
  else
    odie "bloomctl currently only supports macOS arm64. Build from source for other platforms."
  end

  def install
    bin.install "bloomctl-darwin-arm64" => "bloomctl"
  end

  def caveats
    <<~EOS
      bloomctl updates on every push to main (alpha versions) until the
      first stable tag is cut.

      Bootstrap credentials (recommended — token goes to macOS Keychain):

        echo "$IRU_API_TOKEN" | bloomctl auth login --stdin --subdomain <tenant>
        bloomctl auth status

      Discover and invoke operations:

        bloomctl ops list
        bloomctl api <operationId> --param key=value
        bloomctl list device --limit 5

      bloomctl is read-only against your tenant by default; mutating
      operations require --allow-write.

      Every API call writes a structured JSONL audit line under
      ~/.bloomctl/audit/ (macOS) or ~/.local/state/bloomctl/audit/ (Linux).
    EOS
  end

  test do
    assert_match "bloomctl", shell_output("#{bin}/bloomctl --version 2>&1")
  end
end
