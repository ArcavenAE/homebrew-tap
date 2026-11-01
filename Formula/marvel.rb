class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.231825.456df92"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-231825-456df92/marvel-darwin-arm64"
    sha256 "70ff983c9e6482660cd5c34a5216c2e708e6bb38f5fa53bf1e36e07e2025f2de"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-231825-456df92/marvel-darwin-amd64"
    sha256 "6ffff03cc02cfee4ebc3bd2c7b1c98418a9f63fa4682a023a5958d3b2dbce30c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-231825-456df92/marvel-linux-arm64"
    sha256 "cb80de1c1a32ea332365ca10a053465d4df5af2ed386c2761868227793f8c4b7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-231825-456df92/marvel-linux-amd64"
    sha256 "2911f19e19f9d2b2f1695d3fc45cc6a963010514c3e4fb9dbe105cae3eccf6a8"
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
