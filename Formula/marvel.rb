class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.223550.f898a1c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-223550-f898a1c/marvel-darwin-arm64"
    sha256 "4385403984feb21d438c1f3b9b9b39ade15e64e2c53618c5533c9f7b66c7dbf6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-223550-f898a1c/marvel-darwin-amd64"
    sha256 "f59add1ee3552daaf1d79094b19a1f3493e9af572d8b58a75b9c9b00cda8db22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-223550-f898a1c/marvel-linux-arm64"
    sha256 "14e9aa7609d04ce367014a2a118a58e89481447c7b834f23fe530a2a6c536c40"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-223550-f898a1c/marvel-linux-amd64"
    sha256 "019456b35277b36db0a8763593b21b01f80c9d86e05604cce0b3a2179d330b16"
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
