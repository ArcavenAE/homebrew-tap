class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.083628.90fca7c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083628-90fca7c/marvel-darwin-arm64"
    sha256 "20119547d5a9318fdb0f86cbaba760d0efcc4f12714377928c7d8d9084292d50"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083628-90fca7c/marvel-darwin-amd64"
    sha256 "34e10dd564578ec54d93a8ca42f95bec86b70c42d5194afb4a9ec80585d78ce7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083628-90fca7c/marvel-linux-arm64"
    sha256 "1fc3a95f141b0e77c0f0724afc9c9822d59b4f425e86b2db8460a7683b7e2c42"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083628-90fca7c/marvel-linux-amd64"
    sha256 "e26c6982fcafd993faad518e1a4729dc7f6361d483ba92ad660abc4d758add4f"
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
