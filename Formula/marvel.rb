class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.205105.ae15bb6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205105-ae15bb6/marvel-darwin-arm64"
    sha256 "ee39c67a3e0dfa9eb764b3e188cbcd3466ea065055625df28150467b0dfac909"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205105-ae15bb6/marvel-darwin-amd64"
    sha256 "9cda724ec1751e85cc97b9ce7ea059bdba87b22e0193e64040efc8961470cdad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205105-ae15bb6/marvel-linux-arm64"
    sha256 "f966453d45edc60f1369145236df27ed74aa4645b62b6de180a958f28a765a11"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205105-ae15bb6/marvel-linux-amd64"
    sha256 "dd7694aada4457a174b8c2952953adb0202d86209a954140c2dae425418a56e3"
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
