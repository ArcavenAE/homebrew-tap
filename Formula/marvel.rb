class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.055032.6f23762"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-055032-6f23762/marvel-darwin-arm64"
    sha256 "5683f70eeb3fe0f60c2efcda8b556deda869be7df8b880bb8011b7c31b00aff2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-055032-6f23762/marvel-darwin-amd64"
    sha256 "394c4a2c6d01667e51008ba12146ab4717c1ec411f23cbd2f4bda6e594639e59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-055032-6f23762/marvel-linux-arm64"
    sha256 "4cc617e4e8b01344ff0941df9e85f4bc4ae0b1908a2e4adfa1bbd023ee0e476c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-055032-6f23762/marvel-linux-amd64"
    sha256 "566da4630d987b6f07ef350df1b38bc7739abf3d99d93bab5fb2ee836f049c8a"
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
