class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260717.234634.150b82b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-234634-150b82b/marvel-darwin-arm64"
    sha256 "ff359961fa96f4dd303bf1d382032ad65328694068e4db7ece22a8addc323510"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-234634-150b82b/marvel-darwin-amd64"
    sha256 "3f1ab4a8b393f6541d0023e2ff0b8c2eebf61d2a3c6bd70c758b2fd7f8607773"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-234634-150b82b/marvel-linux-arm64"
    sha256 "6171b8904b8a1c22a7bc59b5e61ca9971b9219aa82924e0d6e164c9ae3d75d67"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-234634-150b82b/marvel-linux-amd64"
    sha256 "341ca78a5a416e8bfcdac64e5901bfb9ba0ec213ae1b32f65413fb1ce3c09bd4"
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
