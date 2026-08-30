class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.183512.60cef49"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183512-60cef49/marvel-darwin-arm64"
    sha256 "4f48b7db9d4eabe309b571058c357296e43b349dbf043c9dd68e2fa0293e4c2c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183512-60cef49/marvel-darwin-amd64"
    sha256 "c191cbff861bbb9612b9fd3740edff58d0e3fdef7405e3a4cdd8f25ee1566a19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183512-60cef49/marvel-linux-arm64"
    sha256 "a59f0838ed01caf8513e66f4adb7030238553d56f8033e4f17c8c295505a9427"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183512-60cef49/marvel-linux-amd64"
    sha256 "23853f564a33020f5ce472315d7d2782dd83194e67245daa73aabfc3f4e62604"
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
