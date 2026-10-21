class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.154028.53b9d0b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154028-53b9d0b/marvel-darwin-arm64"
    sha256 "44d1b1a473f40fb7bd154772351bbfc9729006a9d2068ceb2df58b8752159754"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154028-53b9d0b/marvel-darwin-amd64"
    sha256 "e615ac62681581e7fe95e0636fa4304e91bde20620d0bd7a80ef86246c88c6c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154028-53b9d0b/marvel-linux-arm64"
    sha256 "ef87ff02d10829039f7567d87f0bdc4823a838be6c757f39ca279f980430b9e6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154028-53b9d0b/marvel-linux-amd64"
    sha256 "e82d938b5f9c38e7dacd6365680182388aa8410a412ff9e6f474887cdb803a7a"
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
