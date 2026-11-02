class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.051102.b54eca7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-051102-b54eca7/marvel-darwin-arm64"
    sha256 "29c7d4d4feb6dac265c151a48bca0c9c9248b9824ab0e1981b1311c7b23cc098"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-051102-b54eca7/marvel-darwin-amd64"
    sha256 "e89213539645c634b7671708f1a9756e2ab5a22f06d09d1a1a0ddf7189be55ea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-051102-b54eca7/marvel-linux-arm64"
    sha256 "1765b9f02d0df7af5638996c0df652412054384f2e25a4b612aaf36cacd04c71"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-051102-b54eca7/marvel-linux-amd64"
    sha256 "0771d6978689f489904514274056732803465c2a37fd78cedcc5360475362302"
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
