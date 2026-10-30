class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.231126.00a89ae"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231126-00a89ae/marvel-darwin-arm64"
    sha256 "24895845dad0f6686865614d8fd07e7acc91ccd1e97d12dc1ba2e46ed96856cd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231126-00a89ae/marvel-darwin-amd64"
    sha256 "2d487764e8574b0cb9bb81aa0b8183142fdf07781cd17c5cd1023b146e946693"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231126-00a89ae/marvel-linux-arm64"
    sha256 "902a2bbfdecc92984f708b8ff6a08715149d44ce9915c9af5647877678799a84"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231126-00a89ae/marvel-linux-amd64"
    sha256 "b1868e8f760b82e89718fdaf68c2e9caaeb9a9da057f130f68970a85aab75a63"
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
