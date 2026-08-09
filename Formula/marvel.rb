class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.070816.5bdb4e3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070816-5bdb4e3/marvel-darwin-arm64"
    sha256 "01f94c460712b77b38ccbeb7631804611c2ef4973790bd098bf9a0787a7fde5b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070816-5bdb4e3/marvel-darwin-amd64"
    sha256 "5b85e748fbd09c212bc1e641749dcb1e5581aec79087ff0a165c6f76d1319312"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070816-5bdb4e3/marvel-linux-arm64"
    sha256 "eb343e56ff59eeb37b10dd84ae89462c751d1a7e61e500134ecaa319f191e8c7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070816-5bdb4e3/marvel-linux-amd64"
    sha256 "89efadaef41d08a0ffc736337b43547f35cc112154ffc375f7def6c78bebcd75"
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
