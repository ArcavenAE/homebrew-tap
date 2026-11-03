class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261103.071513.c15128c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-071513-c15128c/marvel-darwin-arm64"
    sha256 "af83b35ae28391c25fb5273f4ef332a543167c7f6fbf13906c0e9fa69ddd14e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-071513-c15128c/marvel-darwin-amd64"
    sha256 "5b4c1d51758ce73e7b97828fcf1bd186acfbb9e21272b1993ce982431c56c39c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-071513-c15128c/marvel-linux-arm64"
    sha256 "be04a964143fd86444e13dbbe9688297dd523f3c49ed48ca9c2ce8d4d91d7126"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-071513-c15128c/marvel-linux-amd64"
    sha256 "6dc7350e12191fd10de9361f34d3881fde3a3994e027dca92140e56e9b164cae"
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
