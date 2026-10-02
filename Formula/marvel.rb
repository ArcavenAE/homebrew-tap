class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.224555.deb348c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224555-deb348c/marvel-darwin-arm64"
    sha256 "36587721485c96c7d4922e7e4787bb0b915aec7f014eeb93883eaf4d891d9929"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224555-deb348c/marvel-darwin-amd64"
    sha256 "5279db8d6c7bb04358a060369f53bfd5644f131896511ed584fb3d38c6c138cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224555-deb348c/marvel-linux-arm64"
    sha256 "18fb863d8a9afa9140df5745fde2c70e712a3a4f193c5cbadb9bfbffa56744a2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224555-deb348c/marvel-linux-amd64"
    sha256 "2c66439fddbb9ab16d014f9310a4f39536f76d2a78c991c7a587afdabfc980f2"
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
