class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.014431.3af1a4d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-014431-3af1a4d/sideshow-darwin-arm64"
    sha256 "92123f71b95574075e61f4b00ca4a6d9d6899f61b57cf15b4b163cf4c15ecacf"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-014431-3af1a4d/sideshow-darwin-amd64"
    sha256 "924a0094d914d8dad2bec2bd8cf16583f93bac11572eee34644f1ee5f5ff4c60"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-014431-3af1a4d/sideshow-linux-amd64"
    sha256 "2416df62bdd9178148beafef23fe1a7e122472cd753b1285e023fd20b074c23f"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
