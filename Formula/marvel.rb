class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260923.233128.eddaf7e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-233128-eddaf7e/marvel-darwin-arm64"
    sha256 "3e42e3ef736029fb9017900fe162a408bcf8b8b63bc713574fc8dd64cc914d06"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-233128-eddaf7e/marvel-darwin-amd64"
    sha256 "b2b05dd59cab7aabd61dc721c694ff47b9b399186b2dbaabec05ba5dab14a653"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-233128-eddaf7e/marvel-linux-arm64"
    sha256 "a6cb91210edfc2ca79a8af64941b399f313f9341117b1af53ea50619ba7f5b8e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-233128-eddaf7e/marvel-linux-amd64"
    sha256 "25fac81d886b82b1a424cb0e6ff430401149956696d008c4a5a54dcd5c5da5c3"
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
