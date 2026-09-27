class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260927.195731.a652fdf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-195731-a652fdf/marvel-darwin-arm64"
    sha256 "83f27e8926cea9219678749755ae59930f8f0affb1140080701daea38e3b2511"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-195731-a652fdf/marvel-darwin-amd64"
    sha256 "8b78571b76030081d96098917dab671908922d740767af90aba90029b5457f1c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-195731-a652fdf/marvel-linux-arm64"
    sha256 "dbfd5d2f018467ec56b85a640bbf4563f59df5777deea018f7f99626c166edd2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-195731-a652fdf/marvel-linux-amd64"
    sha256 "92493d39f9e4757707b70c5aef580ea3ff4ab0c0fac7405977ece4ddbf1003e6"
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
