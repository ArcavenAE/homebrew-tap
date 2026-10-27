class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.172503.4afdc41"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-172503-4afdc41/marvel-darwin-arm64"
    sha256 "7fd947aeba550a1a405ddea3d11456a7e0a936d8f8554ea0039a7e85e9f1f08a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-172503-4afdc41/marvel-darwin-amd64"
    sha256 "0211442aea24b3610b7d9758c9212a8cd1d87401b57ed91f4ddaacb498138453"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-172503-4afdc41/marvel-linux-arm64"
    sha256 "98e5d0cd05890f29b5b015ea6653b3dc4a53ef0e562069fc03df29932ec338ee"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-172503-4afdc41/marvel-linux-amd64"
    sha256 "e87b9d1055a3587844795f3d0dbe8f0ac36fe037d92b41e5ee12eba50a3c4b42"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
