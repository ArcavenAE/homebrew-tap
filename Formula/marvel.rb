class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.232004.5170e13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232004-5170e13/marvel-darwin-arm64"
    sha256 "692dd34bd9544f2f808e7b303fc83a17f1d7fcd025f3f03a85b74d8f72a6acb8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232004-5170e13/marvel-darwin-amd64"
    sha256 "cc0cb35f43fe4417837d22aa07ba97536d1e00458ca768c47a5bbf10e1cfd286"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232004-5170e13/marvel-linux-arm64"
    sha256 "98e8d58438a5d6556ef64f1529da80c8b50b91d2724851ca4ce02bc11b0c6d7f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232004-5170e13/marvel-linux-amd64"
    sha256 "4786d4016709af5428ff74bc1219707113aedc504eb7db68a6ac5435ed98e902"
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
