class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.033357.c99ce98"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-033357-c99ce98/marvel-darwin-arm64"
    sha256 "25237f4669bc149665a612ac31a2f34af02b9ee3251306218a7235ea77eac58f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-033357-c99ce98/marvel-darwin-amd64"
    sha256 "04a4c78cce6171183ff232aa50088f6d976541ec40c1df1101c826a76795b427"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-033357-c99ce98/marvel-linux-arm64"
    sha256 "8b3f94d5bd5a782d179bec85aa653ef21553f2088e937f48309edbedd467b6a0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-033357-c99ce98/marvel-linux-amd64"
    sha256 "909367d293b6901d085ce770bf50ca6141cd0a7c750de580abae0adc979ca2a2"
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
