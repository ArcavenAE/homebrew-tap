class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260802.002207.fc88c04"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002207-fc88c04/marvel-darwin-arm64"
    sha256 "af53e9958de96970b5ea04c6927c1541a099e9151b5e4a8eed5356027489dfd4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002207-fc88c04/marvel-darwin-amd64"
    sha256 "4aa3bf3bdc979eee02f54125d1f14889e4a769389d278e3a6b70d641088699a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002207-fc88c04/marvel-linux-arm64"
    sha256 "e01ed0570ce65582a0528a3756d43d8d0910e25c0830a21cfb07c191663ecfec"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002207-fc88c04/marvel-linux-amd64"
    sha256 "f2a331bbec2b9d7deeab09251b465b23463ce0b4c858777c798ab852b3fe38c4"
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
