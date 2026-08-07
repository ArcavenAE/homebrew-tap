class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.065745.9516a48"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-065745-9516a48/marvel-darwin-arm64"
    sha256 "2f4d4a356cb8201ece4a528940bfa2861e5afbf1d9fcb89b8a3b895011541215"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-065745-9516a48/marvel-darwin-amd64"
    sha256 "adf38b82251131918ce44a97d2e9a474c80ce94137fb7f4bb1c1dac532bcb65c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-065745-9516a48/marvel-linux-arm64"
    sha256 "7d1cef6021badc7ed9f08ad6ff8034e6e6cbc8eff55942f3a375543b6e9ddfff"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-065745-9516a48/marvel-linux-amd64"
    sha256 "dd08f7b621483dbbe19f0c7e11daaac07edf19ed20356d30b96642e7ef5fed5f"
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
