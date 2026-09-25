class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.024241.25d228e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024241-25d228e/marvel-darwin-arm64"
    sha256 "363aa82a208498ea33ce103dc3aaa9fbb72679b3035b20824baffbdf1419c157"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024241-25d228e/marvel-darwin-amd64"
    sha256 "8d64c09f12a08365b6c6ae4a78be55876268ec6533aae2c042166d27ec7fb9d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024241-25d228e/marvel-linux-arm64"
    sha256 "ab32e479b6ad51da3f1632704d114115b8bd4ba9c37ae5de4f19f72fe37ee081"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024241-25d228e/marvel-linux-amd64"
    sha256 "544a7dc08eacb8f1f39dc5ec03dd3361595620b10cc43747f6917e5e746bd3aa"
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
