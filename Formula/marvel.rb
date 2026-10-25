class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.173304.1d140c5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173304-1d140c5/marvel-darwin-arm64"
    sha256 "410b2e1cacc3c53391af7a7aa61da7bbcc9143e81de5c93ba02bb6d2a3da4dc0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173304-1d140c5/marvel-darwin-amd64"
    sha256 "795500f5691aa9eb5e91f1d5c0a5803c48e20b72ea06112a55ad833d8ac86c00"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173304-1d140c5/marvel-linux-arm64"
    sha256 "6aaefc1655fd529882ed912facb072ea11e496e71bf2dff4c56ab9693bde69d0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173304-1d140c5/marvel-linux-amd64"
    sha256 "be9125047885d51083a871d4294465b3824f8bf4aec86e037a7d952091b96eed"
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
