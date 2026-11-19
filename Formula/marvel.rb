class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.071934.e17d9ec"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-071934-e17d9ec/marvel-darwin-arm64"
    sha256 "cae5908486f007e33ce27508fa558243c1f2f53931f7aa72c17aa90db01182f7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-071934-e17d9ec/marvel-darwin-amd64"
    sha256 "ce49bda6d87956b47c8b612c1ab01254cdf76736e3a35e33596fb76fd4a1e428"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-071934-e17d9ec/marvel-linux-arm64"
    sha256 "63f2dea5db49654adc60c1cffe76365e60897f213575fb33c619c59b12723f7a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-071934-e17d9ec/marvel-linux-amd64"
    sha256 "9eac92c40118992aef39285d203f55187a9b2d059e578249c2e14d5d290eb6e4"
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
