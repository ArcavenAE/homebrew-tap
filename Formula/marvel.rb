class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.223445.748ffde"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-223445-748ffde/marvel-darwin-arm64"
    sha256 "94f07185e2df63fca2779e802d07e24fcdc0034200ab789c12125019f506248b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-223445-748ffde/marvel-darwin-amd64"
    sha256 "342101d21c6769974fa7065b394e7999942cf0c0d126e0df4854b1b8c3c56a38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-223445-748ffde/marvel-linux-arm64"
    sha256 "bd046d8b149dcab6a92264985461e945d156d254941142b87f5e1e2df8bfddf6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-223445-748ffde/marvel-linux-amd64"
    sha256 "780752bf3d159840f2c9d8a00a519283881016ebe1f49bbed6eb39bd5bc660b3"
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
